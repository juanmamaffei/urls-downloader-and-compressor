require 'rails_helper'

RSpec.describe 'petitions/show', type: :view do
  before(:each) do
    assign(:petition, Petition.create!(
                        zip_url: 'Zip Url',
                        status: 2
                      ))
  end

  xit 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Zip Url/)
    expect(rendered).to match(/2/)
  end
end
