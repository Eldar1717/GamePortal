class Review < ApplicationRecord
  belongs_to :user
  belongs_to :game
  has_many :comments, as: :commentable, dependent: :destroy

  # Добавляем валидации
  validates :rating, presence: true,
                     numericality: { only_integer: true, in: 1..5 }
  validates :content, presence: true, length: { minimum: 10 }

  # Метод для отображения рейтинга звездами
  def star_rating
    "⭐" * rating.to_i
  end

  # Проверяем, может ли пользователь редактировать отзыв
  def editable_by?(user)
    user == self.user
  end
end
