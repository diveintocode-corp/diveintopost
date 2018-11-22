class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :content, presence: true, length: { minimum: 1, maximum: 1000 }
  belongs_to :user
  belongs_to :team
  belongs_to :agenda
  has_many :comments, dependent: :destroy
  mount_uploader :image, ImageUploader
end
