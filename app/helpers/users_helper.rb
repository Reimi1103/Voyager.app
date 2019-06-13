module UsersHelper

  def gravatar_for(user)
  gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
  gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
  image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end




  def image_for(user)
    @book = Book.find_by(id: params[:id])
    @user = User.find_by(id: @book.user_id)
    if @user.image
      image_tag "/#{@user.image}"
    else
      image_tag "profile_icon.jpg"
    end
  end

  def current_user?(user)
    user == current_user
  end

  def active_book(current_user)
    current_user.books.where(progress: true)

  end

      

end
