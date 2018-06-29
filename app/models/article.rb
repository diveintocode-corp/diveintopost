class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user
  belongs_to :team
  belongs_to :agenda
end
