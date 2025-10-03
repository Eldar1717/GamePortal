# app/controllers/games_controller.rb
class GamesController < ApplicationController
  def index
    @games = Game.all.includes(:reviews)
  end

  def show
    @game = Game.find(params[:id])
    @review = Review.new # для формы нового отзыва
    @reviews = @game.reviews.includes(:user).order(created_at: :desc)
  end
end
