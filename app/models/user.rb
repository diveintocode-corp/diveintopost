class User < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  has_many :articles
  has_many :comments
end
