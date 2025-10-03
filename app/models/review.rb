class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comments, as: :commentable, dependent: :destroy
end
