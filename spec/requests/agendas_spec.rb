require 'rails_helper'

RSpec.describe "Agendas", type: :request do
  describe "GET /agendas" do
    it "works! (now write some real specs)" do
      get agendas_path
      expect(response).to have_http_status(200)
    end
  end
end
