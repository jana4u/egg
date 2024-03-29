require 'spec_helper'

describe "account/characters/index.html.erb" do
  before(:each) do
    assign(:characters, [
      stub_model(Character,
        :name => "Name"
      ),
      stub_model(Character,
        :name => "Name"
      )
    ])
  end

  it "renders a list of account/characters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
