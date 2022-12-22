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
  end

  private

  def download_subfiles
    @subfiles.each do |subfile|
      FilesDownloader.new(subfile, @petition).run
    end
  end

  def compress_subfiles
    FilesCompressor.new(@petition.id).run
  end

  def upload_zip_file
    # Upload the zip file to S3
  end

  def delete_temp_directory
    # Delete the temp directory
  end

  def update_petition
    # Update the Petition with the zip file location
  end
end
