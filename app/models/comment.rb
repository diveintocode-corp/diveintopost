class Comment < ApplicationRecord
  include PostMessageTransable

  belongs_to :user
  belongs_to :article

  validates :content, presence: true

  def slack_message
    <<~EOS
      >>> *Posted comment* <#{article_url(article)}|#{article.title}> by #{user.name}
      #{content}
    EOS
  end
end
