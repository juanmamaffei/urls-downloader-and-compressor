require 'rails_helper'

RSpec.describe "Files", type: :request do
  describe "GET /run" do
    xit "returns http success" do
      get "/files/run"
      expect(response).to have_http_status(:success)
    end
  end

end
