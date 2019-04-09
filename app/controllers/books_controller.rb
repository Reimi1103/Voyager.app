class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  #before_action :duplicate_ban, only: [:new, :create]
  before_action :correct_user,   only: [:edit, :update, :destroy]


  # GET /books
  # GET /books.json
  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
    @nice = Nice.new

    #@Comments = Comment.find_by(id: @user.post_id)

  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit

  end

  # POST /books
  # POST /books.json
  def create
    @book = current_user.books.new(book_params)
    @book.progress = false
    tags = params[:bookHashTag][:tag].split
    if @book.save
      tags.each do |tag|
        @bookHashTag = BookHashTag.new(tag: tag,book_id: @book.id)
        @bookHashTag.save
      end
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if params[:book][:progress] == "true"
        prog = true
      else
        prog =false
      end
      @book.progress = prog
      if @book.update_attributes(book_params)
      # if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:user_id, :title, :prologue, :bookCover, :schedule)
    end

    def bookHashTag_params
      params.require(:postHashTag).permit(:tag)
    end


    def duplicate_ban
      if current_user.books.map(&:progress).include?(nil)
        #進行中のBookが存在する
        redirect_to root_path,danger: "進行中のBookがあります。"
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end
