class EnqueueCompression
  include Rails.application.routes.url_helpers
  def initialize(files_string)
    @files_string = files_string
  end

  def run
    # Parse string as array of file urls
    parsed_urls = UrlParserUtil.new.parse(@files_string)

    # Create Petition and related Files
    create_petition
    assign_files(parsed_urls)

    # Create CompressionJob with petition_id
    CompressionJob.perform_later(@petition.id)

    # Return URL to follow for status
    response
  end

  private

  def create_petition
    @petition = Petition.create(status: 'pending')
  end

  def assign_files(urls)
    urls.each do |url|
      @petition.subfiles.create(url:, status: 'pending')
    end
  end

  def response
    {
      status: @petition.status,
      zip_url: @petition.zip_file.url,
      petition_url: petition_url(@petition, host: )
    }
  end

  def host
    Rails.env.production? ? ENV['APP_HOST'] : 'localhost:3000'
  end
end
