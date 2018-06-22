require 'rails_helper'

RSpec.describe StaticsController, type: :controller do
  describe 'GET #top' do
    login_user
    it 'returns http success' do
      get :top
      expect(response).to have_http_status(:success)
    end
  end
end
