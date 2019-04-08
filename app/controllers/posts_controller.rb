class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @post = Post.new
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  @post = Post.find(params[:id])
  @comments = @post.comments
  @comment = Comment.new
  @nice = Nice.new
  end


  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    @post.book_id = params[:book_id]
    @post.save


    @postHashTag = PostHashTag.new
    @postHashTag.tag = postHashTag_params[:tag]
    @postHashTag.user_id = current_user[:id]
    @postHashTag.save

    redirect_to book_post_path(@post.book_id,@post.id)
  end



  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to book_post_path(@post.book_id,@post.id), notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :text, :image1, :image2, :image3, :longitude, :latitude, :book_id)
    end

    def postHashTag_params
      params.require(:postHashTag).permit(:tag)
end

end