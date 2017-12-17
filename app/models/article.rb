class Article < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def slack_title
    "Created article #{title}"
  end
end
