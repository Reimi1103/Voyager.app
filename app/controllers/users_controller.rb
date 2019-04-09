class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
      if @user.save
        log_in @user
        redirect_to root_path,success:"登録完了"
        else
          flash[:danger] = "登録失敗"
          render 'new'
      end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
    render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end

  def favorites
    @favorites = Favorite.find_by(user_id: current_user.id)
    @books = Book.find_by(id: @favorites.book_id)
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:introduction,:points,:weblink,:thaksImage)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end


end


