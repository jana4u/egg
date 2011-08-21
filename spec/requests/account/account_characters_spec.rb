require 'spec_helper'

describe "Account::Characters" do
  describe "GET /account/characters" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get account_characters_path
      response.status.should be(302)
      response.should redirect_to(new_user_session_path)
    end
  end
end
