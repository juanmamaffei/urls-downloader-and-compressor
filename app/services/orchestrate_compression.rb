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
    delete_temp_files
    update_petition_status
    @petition.zip_file.url
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
      io: File.open("tmp/#{@petition.id}.zip"),
      filename: "#{@petition.id}.zip",
      content_type: 'application/zip'
    )
  end

  def update_petition_status
    @petition.update(status: 'done')
  end

  def delete_temp_files
    Dir.delete("tmp/#{@petition.id}") if Dir.exist?("tmp/#{@petition.id}")
    File.delete("tmp/#{@petition.id}.zip") if File.exist?("tmp/#{@petition.id}.zip")
  rescue StandardError
    true
  end
end
