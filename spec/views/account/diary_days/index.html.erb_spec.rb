require 'spec_helper'

describe "account/diary_days/index.html.erb" do
  before(:each) do
    assign(:character, stub_model(Character, :id => "1"))
    assign(:diary_days, [
      stub_model(DiaryDay),
      stub_model(DiaryDay)
    ])
  end

  it "renders a list of account/diary_days" do
    render
  end
end
