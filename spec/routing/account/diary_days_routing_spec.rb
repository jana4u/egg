require "spec_helper"

describe Account::DiaryDaysController do
  describe "routing" do

    it "routes to #index" do
      get("/account/characters/2/diary_days").should route_to("account/diary_days#index", :character_id => "2")
    end

    it "routes to #new" do
      get("/account/characters/2/diary_days/new").should route_to("account/diary_days#new", :character_id => "2")
    end

    it "routes to #show" do
      get("/account/characters/2/diary_days/1").should route_to("account/diary_days#show", :character_id => "2", :id => "1")
    end

    it "routes to #edit" do
      get("/account/characters/2/diary_days/1/edit").should route_to("account/diary_days#edit", :character_id => "2", :id => "1")
    end

    it "routes to #create" do
      post("/account/characters/2/diary_days").should route_to("account/diary_days#create", :character_id => "2")
    end

    it "routes to #update" do
      put("/account/characters/2/diary_days/1").should route_to("account/diary_days#update", :character_id => "2", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account/characters/2/diary_days/1").should route_to("account/diary_days#destroy", :character_id => "2", :id => "1")
    end

  end
end
