class Game < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, :developer, :platform, presence: true
end
