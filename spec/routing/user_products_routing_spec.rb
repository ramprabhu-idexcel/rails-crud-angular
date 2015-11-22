require "rails_helper"

RSpec.describe UserProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_products").to route_to("user_products#index")
    end

    it "routes to #new" do
      expect(:get => "/user_products/new").to route_to("user_products#new")
    end

    it "routes to #show" do
      expect(:get => "/user_products/1").to route_to("user_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_products/1/edit").to route_to("user_products#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_products").to route_to("user_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/user_products/1").to route_to("user_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/user_products/1").to route_to("user_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_products/1").to route_to("user_products#destroy", :id => "1")
    end

  end
end
