require 'spec_helper'

describe "account/diary_days/show.html.erb" do
  before(:each) do
    assign(:character, stub_model(Character, :id => "1"))
    assign(:diary_day, stub_model(DiaryDay))
  end

  it "renders attributes in <p>" do
    render
  end
end
