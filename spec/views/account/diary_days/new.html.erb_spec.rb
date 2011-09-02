require 'spec_helper'

describe "account/diary_days/new.html.erb" do
  before(:each) do
    @character = assign(:character, stub_model(Character, :id => "1"))
    assign(:diary_day, stub_model(DiaryDay).as_new_record)
  end

  it "renders new diary_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_character_diary_days_path(@character), :method => "post" do
    end
  end
end
