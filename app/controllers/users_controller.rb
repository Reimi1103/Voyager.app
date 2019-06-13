class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user,   only: [:edit, :update, :destroy]


  def index
    @users = User.all
  end

  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    @user.image = open("#{Rails.root}/public/human.jpeg")
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


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @activeBook =@books.find_by(progress: false)
    @log = @books.where(progress: true)
    @bookLogs = @log.all.order(created_at: :desc)
  end



  def charge
    @amount = 500#引き落とす金額
    @charge = 500
    ###この操作で、Stripe から帰ってきた情報を取得します
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],#emailは暗号化されずに受け取れます
      source: params[:stripeToken],
    })

    Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'jpy',
    })
    @charge_modal_flag = true

    current_user.point += @charge.to_i
    current_user.save
    redirect_to user_path(id: current_user,modal_flag: @charge_modal_flag)
  end



  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_path
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
    @books=current_user.favorite_books
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    #def set_user
    # @user = User.find(params[:id])
    #end

    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:introduction,:points,:weblink,:image,:thanksImage)
    end


    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end


end


