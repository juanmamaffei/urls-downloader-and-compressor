# Takes all the files in the petition_id folder
# and compresses them into a zip file.
# Filename should be petition_id.zip
class Compressor
  def initialize(petition_id)
    @petition_id = petition_id
  end

  def run
    files = Dir["tmp/#{@petition_id}/*"]
    Zip::File.open("tmp/#{@petition_id}.zip", Zip::File::CREATE) do |zipfile|
      files.each do |file|
        zipfile.add(file.split('/')[-1], file)
      end
    end
  rescue Zip::Error => e
    raise StandardError, "Error compressing files: #{e}"
  end
end
