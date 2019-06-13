class SearchController < ApplicationController

    # --------------- Postのサーチ -----------------
    def post_search
        #Viewのformで取得したパラメータをモデルに渡す
        @posts = PostHashTag.search(params[:search])
        @nav_flag = "on"
    end

    def book_search
        #Viewのformで取得したパラメータをモデルに渡す
        @books = BookHashTag.search(params[:search])
        @nav_flag = "on"
    end



    private
    def search_params
        params.require(:post_hash_tags).permit(:tag)
    end




end
