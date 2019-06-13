class PostsController < ApplicationController
  before_action :set_post, only: [:destroy]
  before_action :correct_user,  only: [:new, :edit, :update, :destroy]
  before_action :show_post, only: [:show,:edit,:update ]



  def map
    # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    # respond_to以下の記述によって、
    # remote: trueのアクセスに対して、
    # map.js.erbが変えるようになります。
    respond_to do |format|
      format.js
    end
  end



  # GET /posts
  # GET /posts.json
  def _index
    @posts = Post.all
    @nav_flag = "on"
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  @post = Post.find(params[:id])
  @book = Book.find(params[:book_id])
  @comment = Comment.new
  @nice = Nice.new
  @comments = @post.comments
  @points = @post.comment_points if @comments.present?
    if  params[:modal] == "true"
      @modal_flag = true
    else
      @modal_flag = false
    end
  end

  # GET /posts/new
  def new
    
    @post = Post.new
    @postHashTag = PostHashTag.new
  end

  # GET /posts/1/edit
  def edit

  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(post_params)
    @post.book_id = params[:book_id]
    tags = params[:postHashTag][:tag]
    tagsSplit = []
    if tags.present?
      tagsDelete = tags.delete("#")
      tagsDelete = tagsDelete.delete("＃")
      tagsSplit = tagsDelete.split(/[,|.|\s|　]/)
    end
    if @post.save
        tagsSplit.each do |tag|
          @postHashTag = PostHashTag.new(tag: tag,post_id: @post.id)
          @postHashTag.save
        end
    end
    redirect_to book_path(params[:book_id])
  end



  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        @post.post_hash_tags.each_with_index do |hash_tag,i|
          if PostHashTag.find_by(id: params[:hash_tag]["id_#{i}"]) == hash_tag
            hash_tag.update_attributes(tag: params[:hash_tag]["tag_#{i}"])
          end
        end
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
    def show_post
      @post = Post.find(params[:id])
    end

    def set_post
      @post = Post.find(params[:post_id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :text, :image1, :image2, :image3, :longitude, :latitude, :book_id, post_hash_tags_attributes:[:tag, :_destroy, :id])
    end


    def postHashTag_params
      params.require(:postHashTag_attributes).permit(:tag)
    end

    def correct_user
      @book = Book.find_by(id: params[:book_id])
      @user = User.find(@book.user_id)
      if @user != current_user
      redirect_to(root_url)
      end
    end


  end
