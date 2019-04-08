class NicesController < ApplicationController
  before_action :set_variables


def create
  nice = Nice.new
  nice.user_id = current_user.id
  nice.post_id = params[:post_id]
  nice.save
  redirect_back(fallback_location: root_path)
end

def destroy
  nice = current_user.nices.find_by(post_id: @post.id)
  nice.destroy
  redirect_back(fallback_location: root_path)
end


private

def set_variables
  @post = Post.find(params[:post_id])
end

end
