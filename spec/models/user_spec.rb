require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

  describe 'パスワードとしてランダムな20文字の16進数文字列を生成する。' do
    it '生成されたユーザーのパスワードを文字列として返すこと' do
      expect(User.generate_password.class).to eq String
    end

    it 'Userが入力したパスワードと生成された文字列の文字数は常に同じか' do
      expect(User.generate_password.length).to eq 20
    end
  end
