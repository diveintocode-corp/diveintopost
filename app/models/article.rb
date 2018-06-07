class Article < ApplicationRecord
  belongs_to :user
  belongs_to :team
  belongs_to :agenda
end
