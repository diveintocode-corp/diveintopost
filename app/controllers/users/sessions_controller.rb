class Users::SessionsController < Devise::SessionsController
  layout 'login/application'

  private

  def after_sign_in_path_for(_resource)
    dashboard_url
  end
end
