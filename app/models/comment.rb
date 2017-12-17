class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :content, presence: true

  def slack_title
    "Posted comment to #{article.title}"
  end
end
