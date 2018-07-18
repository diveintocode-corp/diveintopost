class Users::SessionsController < Devise::SessionsController
  layout 'login/application'

  private

  def after_sign_in_path_for(resource)
    team_url(resource.teams.first)
  end
end
