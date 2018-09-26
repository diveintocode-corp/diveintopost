require 'rails_helper'

RSpec.describe User, type: :model do
  describe '引数で送られてきたアドレスを検索して、Userをcreateもしくはfindする' do
    let!(:created_user) { User.create(email: 'created_user@example.com', password: '199392199392') }
    let!(:not_created_user) { User.find_or_create_by_email('not_created_user@example.com') }

    it '引数で送られてきたアドレスを持っているUserがいたら、そのUserをfindしてインスタンスを返り値で返す' do
      expect(User.find_or_create_by_email('created_user@example.com')).to eq created_user
    end

    it '引数で送られてきたアドレスを持っているUserがいなかったら、Userをcreateして、そのインスタンスを返す' do
      expect(not_created_user.persisted?).to eq true
      expect(not_created_user.encrypted_password.present?).to eq true
    end
  end
end