class EnqueueCompression 
  def initialize(files_string)
    @files_string = files_string
  end

  def run
    # Parse string as array of file urls
    parsed_urls = UrlParserUtil.new.parse(@files_string)
    # Create Petition and related Files

    # Create CompressionJob with petition_id

    # Return URL to follow for status

  end
end
