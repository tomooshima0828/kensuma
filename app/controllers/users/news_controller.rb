module Users
  class NewsController < Users::Base
    def index
      @news_all = News.all.order(delivered_at: 'DESC')
    end

    def show
      @news = News.find(params[:id])
      # news_userがあれば既読と判定する
      unless current_user.news_users.present?
        news_user = current_user.news_users.build
        news_user.news = @news
        news_user.save!
      end
    end
  end
end
