require 'rails_helper'

RSpec.describe ArticlesController, type: :routing do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'routing' do
    it 'routes to #index' do
      team = Team.create! valid_attributes
      expect(get: "teams/#{team.id}/articles").to route_to('articles#index')
    end

    it 'routes to #new' do
      team = Team.create! valid_attributes
      expect(get: "teams/#{team.id}/articles/new").to route_to('articles#new')
    end

    it 'routes to #show' do
      expect(get: '/articles/1').to route_to('articles#show', id: '1')
    end

    it 'routes to #edit' do
      team = Team.create! valid_attributes
      expect(get: "teams/#{team.id}/articles/edit").to route_to('articles#edit', id: '1')
    end

    it 'routes to #create' do
      team = Team.create! valid_attributes
      expect(post: "teams/#{team.id}/articles").to route_to('articles#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/articles/1').to route_to('articles#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/articles/1').to route_to('articles#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/articles/1').to route_to('articles#destroy', id: '1')
    end
  end
end
