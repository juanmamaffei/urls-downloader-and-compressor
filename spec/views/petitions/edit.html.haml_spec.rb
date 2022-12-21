require 'rails_helper'

RSpec.describe "petitions/edit", type: :view do
  let(:petition) {
    Petition.create!(
      zip_url: "MyString",
      status: 1
    )
  }

  before(:each) do
    assign(:petition, petition)
  end

  it "renders the edit petition form" do
    render

    assert_select "form[action=?][method=?]", petition_path(petition), "post" do

      assert_select "input[name=?]", "petition[zip_url]"

      assert_select "input[name=?]", "petition[status]"
    end
  end
end
