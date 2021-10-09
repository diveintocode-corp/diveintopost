module TeamHelper
  def default_img(image)
    image.presence || 'default.jpg'
  end

  def canTransferAuthority?(team, user)
    current_user.id == team.owner.id && user.id != current_user.id
  end
end
