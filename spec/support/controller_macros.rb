# Deviseログインを実現した状態のテストコードを書くための設定を記述
module ControllerMacros
  def sign_in_user
    before(:each) do
      allow(controller).to receive(:authenticate_user!).and_return(true)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user)
    end
  end
end
