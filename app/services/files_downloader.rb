require "open-uri"

class FilesDownloader
  def initialize(subfile, petition)
    @subfile = subfile
    @petition = petition
  end

  def run 
    begin
      download = URI.parse(@subfile.url).open
      Dir.mkdir "tmp/#{@petition.id}" unless File.exists?("tmp/#{@petition.id}")
      IO.copy_stream(download, "tmp/#{@petition.id}/#{download.base_uri.to_s.split('/')[-1]}")
    rescue Errno::ENOENT => e
      track_error(@subfile)
      raise StandardError, "Error downloading file: #{@subfile.url}"
    end
  end

  private

  def track_error(subfile)
    subfile.update(status: "error")
    @petition.update(status: "error")
  end
end
