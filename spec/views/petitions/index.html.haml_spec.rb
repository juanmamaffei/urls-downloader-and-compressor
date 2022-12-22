require 'rails_helper'

RSpec.describe 'petitions/index', type: :view do
  before(:each) do
    assign(:petitions, [
             Petition.create!(
               zip_url: 'Zip Url',
               status: 2
             ),
             Petition.create!(
               zip_url: 'Zip Url',
               status: 2
             )
           ])
  end

  xit 'renders a list of petitions' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new('Zip Url'.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
