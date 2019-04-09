class FavoritesController < ApplicationController
  def create
    @book_id = params[:book_id]
    Favorite.create(user_id: current_user.id,book_id: params[:book_id])
  end

  def destroy
    @book_id = params[:book_id]
    if favorite = Favorite.find_by(user_id: current_user.id,book_id: params[:book_id])
      favorite.delete
    end
  end

end
