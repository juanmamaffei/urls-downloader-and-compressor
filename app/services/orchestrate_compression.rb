class OrchestrateCompression
  def initialize(petition_id)
    @petition = Petition.find(petition_id)
  end

  def run
    # Take Petition and related files

    # Download each file in a temp directory
    
    # Compress the files into a zip file

    # Upload the zip file to S3

    # Delete the temp directory

    # Update the Petition with the zip file location

  end
end
