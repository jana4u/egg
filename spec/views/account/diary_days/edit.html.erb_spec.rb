require 'spec_helper'

describe "account/diary_days/edit.html.erb" do
  before(:each) do
    @character = assign(:character, stub_model(Character, :id => "1"))
    @diary_day = assign(:diary_day, stub_model(DiaryDay))
  end

  it "renders the edit diary_day form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_character_diary_day_path(@character, @diary_day), :method => "post" do
    end
  end
end
