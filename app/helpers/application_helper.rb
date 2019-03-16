module ApplicationHelper

  # ページごとの完全なタイトルを返します。
  def full_title(page_title = '')
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def duplicate_ban?
    if current_user.books.map(&:progress).include?(nil)
      #進行中のBookが存在する
      return true
    else
      return false
    end
  end
end
