require "spec_helper"

describe UrlParserUtil do
  context "with valid urls" do
    context "with a single url" do
      let(:params) { "http://www.example.com" }
      let(:result) { UrlParserUtil.new.parse(params) }

      it "should return an array" do
        expect(result).to be_an(Array)
      end

      it "should return an array with one element" do
        expect(result.size).to eq(1)
      end

      it "should return an array with the correct url" do
        expect(result.first).to eq(params)
      end
    end

    context "with multiple urls" do
      let(:params) { "http://www.example.com;http://www.example2.com" }
      let(:result) { UrlParserUtil.new.parse(params) }

      it "should return an array" do
        expect(result).to be_an(Array)
      end

      it "should return an array with two elements" do
        expect(result.size).to eq(2)
      end

      it "should return an array with the correct urls" do
        expect(result).to eq(params.split(";"))
      end
    end
  end

  context "with invalid urls" do
    let(:params) { "http://www.example.com,http://www.example2.com" }
    let(:result) { UrlParserUtil.new.parse(params) }

    it "should not return the correct urls" do
      expect(result).not_to eq(params.split(","))
    end
  end

end
