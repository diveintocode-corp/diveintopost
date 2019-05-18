module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def first_game
    return if User.current_user.nil?
    if Team.first.nil?
      Team.create(
        name: 'First Team!',
        owner_id: User.current_user.id
      )
    end
    User.current_user.assigns.create!(team_id: Team.first.id) if User.current_user.teams.blank?
  end
end
