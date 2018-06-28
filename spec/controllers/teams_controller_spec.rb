require 'rails_helper'

RSpec.describe TeamsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      team = Team.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      team = Team.create! valid_attributes
      get :show, params: { id: team.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    sign_in_user
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      team = Team.create! valid_attributes
      get :edit, params: { id: team.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Team' do
        expect do
          post :create, params: { team: valid_attributes }, session: valid_session
        end.to change(Team, :count).by(1)
      end

      it 'redirects to the created team' do
        post :create, params: { team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(Team.last)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { team: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested team' do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: new_attributes }, session: valid_session
        team.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the team' do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: valid_attributes }, session: valid_session
        expect(response).to redirect_to(team)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        team = Team.create! valid_attributes
        put :update, params: { id: team.to_param, team: invalid_attributes }, session: valid_session
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested team' do
      team = Team.create! valid_attributes
      expect do
        delete :destroy, params: { id: team.to_param }, session: valid_session
      end.to change(Team, :count).by(-1)
    end

    it 'redirects to the teams list' do
      team = Team.create! valid_attributes
      delete :destroy, params: { id: team.to_param }, session: valid_session
      expect(response).to redirect_to(teams_url)
    end
  end
end
