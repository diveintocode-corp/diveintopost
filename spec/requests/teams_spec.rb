require 'rails_helper'

RSpec.describe 'Teams', type: :request do
  describe 'GET /teams' do
    it 'works! (now write some real specs)' do
      # loginしているuserのいない状態なのでリダイレクトする。現状テストでユーザをログインさせる状態がわからないので一旦これで。

      get teams_path
      expect(response).to have_http_status(302)
    end
  end
end
