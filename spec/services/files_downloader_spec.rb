require "spec_helper"

describe FilesDownloader, :vcr do
  let!(:petition) { Petition.create }
  let!(:subfile1) { Subfile.create(petition_id: petition.id, url: "https://www.orimi.com/pdf-test.pdf") }
  let!(:subfile2) { Subfile.create(petition_id: petition.id, url: "https://invalid-route.pdf") }
  #let!(:subfile2) { Subfile.create(petition_id: petition.id, url: "http://s29.q4cdn.com/175625835/files/doc_downloads/test.pdf") }

  context "with a valid file" do
    it "downloads a file" do
      described_class.new(subfile1, petition).run
      file_exists = File.exists?("tmp/#{petition.id}/pdf-test.pdf")
      expect(file_exists).to be true
    end
  end

  context "with an invalid file" do
    it "does not download a file" do
      expect { described_class.new(subfile2, petition).run }
        .to raise_error(StandardError)
      file_exists = File.exists?("tmp/#{petition.id}/test.pdf")
      expect(file_exists).to be false
    end
  end

end
