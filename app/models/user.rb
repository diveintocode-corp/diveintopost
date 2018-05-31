class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :teams, foreign_key: :owner_id
  has_many :assigns, dependent: :destroy
  has_many :teams, through: :assigns
  has_many :articles, dependent: :destroy
end
