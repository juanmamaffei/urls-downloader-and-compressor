require 'rails_helper'

RSpec.describe 'petitions/new', type: :view do
  before(:each) do
    assign(:petition, Petition.new(
                        zip_url: 'MyString',
                        status: 1
                      ))
  end

  it 'renders new petition form' do
    render

    assert_select 'form[action=?][method=?]', petitions_path, 'post' do
      assert_select 'input[name=?]', 'petition[zip_url]'

      assert_select 'input[name=?]', 'petition[status]'
    end
  end
end
