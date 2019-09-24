module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def is_owner?
    team = Team.friendly.find(params[:id])
    current_user.id == team.owner_id
  end
end
