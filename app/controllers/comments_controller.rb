class CommentsController < ApplicationController


  def new
  end

  def create
    @comment = Comment.new(comment_params)
    @book = Book.find_by(id: params[:comment][:book_id])
    @book_id = params[:comment][:book_id]
    @take_user = @book.user
    @give_user = User.find(current_user.id)
    usePoint = params[:point][:usePoint].to_i
    curPoint = current_user[:point]
    point = Point.new
    if point.pointCheck(usePoint,curPoint)
      puts "障害"
      @post = Post.find(params[:comment][:post_id])
      render "posts/show"
      return
    else
      @comment = Comment.create(comment_params)
      @modal_flag = false
      puts "保存"
      if usePoint != 0
        puts "ポイント"
        @point = Point.new(usePoint: usePoint,comment_id: @comment.id,user_id: current_user.id)
        @point.save
        @give_user.point -= usePoint
        @give_user.save
        @take_user.point +=  usePoint
        @take_user.save
        @modal_flag = true
      end
      redirect_to book_post_path(book_id: @book_id, modal: @modal_flag,id: comment_params[:post_id]) 
      # モーダルに300ポイント以上ならtrueが入るようにする。viewの一番下にモーダルのコードを書いて、paramsmodalでtrueだったらモーダルを表示するようにする。
    end
  end


  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to  request.referrer || root_url 
  end


  private
    def comment_params
    params.require(:comment).permit(:comment, :user_id ,:post_id)
    end

    def point_params
    params.require(:point).permit(:usePoint)
    end
  
end
