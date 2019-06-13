class NicesController < ApplicationController
  before_action :set_variables


  def create
    @nice = Nice.create(user_id: current_user.id,post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
  end

  def destroy
    nice = Nice.find_by(user_id: current_user.id,post_id: params[:post_id])
    @post = Post.find_by(id: params[:post_id])
    nice.delete
  end



private

def set_variables
  @post = Post.find(params[:post_id])
end

end
