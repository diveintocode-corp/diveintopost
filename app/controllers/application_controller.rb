class ApplicationController < ActionController::Base

  include TeamHelper
  before_action :set_working_team, if: :user_signed_in?
  before_action :set_current_user

  def set_current_user
    User.current_user = current_user
    first_game if user_signed_in?
  end

  private

  def set_working_team
    @working_team = current_user.keep_team
    if @working_team.nil?
      first_game
      @working_team = current_user.keep_team
    end
  end
end
