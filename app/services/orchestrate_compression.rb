require 'open-uri'

class OrchestrateCompression
  def initialize(petition)
    @petition = petition
    @subfiles = petition.subfiles
  end

  def run
    # Download each file in a temp directory
    download_subfiles

    # Compress the files into a zip file
    compress_subfiles

    # Upload the zip file to S3
    upload_zip_file

    # Delete the temp directory
    delete_temp_directory

    # Update the Petition with the zip file location
    update_petition
  end

  private

  def download_subfiles
    @subfiles.each do |subfile|
      FilesDownloader.new(subfile, @petition).run
    end
  end

  def compress_subfiles
    # Compress the files into a zip file
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
