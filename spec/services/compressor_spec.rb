require 'spec_helper'

describe Compressor, :vcr do
  context 'with valid files' do
    let(:petition) { Petition.create }

    before do
      subfile1 = Subfile.create(petition_id: petition.id, url: 'https://www.orimi.com/pdf-test.pdf')
      subfile2 = Subfile.create(petition_id: petition.id, url: 'http://s29.q4cdn.com/175625835/files/doc_downloads/test.pdf')
      FilesDownloader.new(subfile1, petition).run
      FilesDownloader.new(subfile2, petition).run
    end

    after do
      FileUtils.rm_rf(Dir["tmp/*"])
    end

    it 'creates the correct zip file' do
      described_class.new(petition.id).run
      zip_file = File.exist?('tmp/1.zip')
      expect(zip_file).to be true
    end

    it 'creates the correct zip file with the correct content' do
      described_class.new(petition.id).run
      Zip::File.open('tmp/1.zip') do |zip_file|
        expect(zip_file.entries.map(&:name)).to match_array(['pdf-test.pdf', 'test.pdf'])
      end
    end
  end
end
