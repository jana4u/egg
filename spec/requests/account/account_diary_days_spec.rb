require 'spec_helper'

describe "Account::DiaryDays" do
  describe "GET /account_diary_days" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get account_character_diary_days_path(1)
      response.status.should be(302)
      response.should redirect_to(new_user_session_path)
    end
  end
end
