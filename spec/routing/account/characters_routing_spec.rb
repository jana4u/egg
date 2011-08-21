require "spec_helper"

describe Account::CharactersController do
  describe "routing" do

    it "routes to #index" do
      get("/account/characters").should route_to("account/characters#index")
    end

    it "routes to #new" do
      get("/account/characters/new").should route_to("account/characters#new")
    end

    it "routes to #show" do
      get("/account/characters/1").should route_to("account/characters#show", :id => "1")
    end

    it "routes to #edit" do
      get("/account/characters/1/edit").should route_to("account/characters#edit", :id => "1")
    end

    it "routes to #create" do
      post("/account/characters").should route_to("account/characters#create")
    end

    it "routes to #update" do
      put("/account/characters/1").should route_to("account/characters#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/account/characters/1").should route_to("account/characters#destroy", :id => "1")
    end

  end
end
