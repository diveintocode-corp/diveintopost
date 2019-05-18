class Article < ApplicationRecord
  validates :title, text: true
  validates :content, text: true
  belongs_to :user
  belongs_to :team
  belongs_to :agenda
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
