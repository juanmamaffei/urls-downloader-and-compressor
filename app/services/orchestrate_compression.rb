require 'open-uri'

class OrchestrateCompression
  def initialize(petition)
    @petition = petition
    @subfiles = petition.subfiles
  end

  def run
    download_subfiles
    compress_subfiles
    upload_zip_file
    delete_temp_directory
    update_petition
    Rails.application.routes.url_helpers.rails_blob_path(@petition.zip_file, only_path: true)
  end

  private

  def download_subfiles
    @subfiles.each do |subfile|
      FilesDownloader.new(subfile, @petition).run
    end
  end

  def compress_subfiles
    Compressor.new(@petition.id).run
  end

  def upload_zip_file
    @petition.zip_file.attach(
                    io: File.open("tmp/#{@petition.id}"),
                    filename: @petition.id.to_s,
                    content_type: 'application/zip'
                  )
  end

  def delete_temp_directory
    # Delete the temp directory
  end

  def update_petition
    # Update the Petition with the zip file location
  end
end
