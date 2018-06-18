require "rails_helper"

RSpec.describe AgendasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/agendas").to route_to("agendas#index")
    end

    it "routes to #new" do
      expect(:get => "/agendas/new").to route_to("agendas#new")
    end

    it "routes to #show" do
      expect(:get => "/agendas/1").to route_to("agendas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agendas/1/edit").to route_to("agendas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/agendas").to route_to("agendas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agendas/1").to route_to("agendas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agendas/1").to route_to("agendas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agendas/1").to route_to("agendas#destroy", :id => "1")
    end

  end
end
