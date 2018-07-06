class Article < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :agenda
  mount_uploader :image, ImageUploader
end
