require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET team/:team_id/articles' do
    it 'works! (now write some real specs)' do
      team = Team.create! valid_attributes
      get team_articles_path(team.id)
      expect(response).to have_http_status(200)
    end
  end
end
