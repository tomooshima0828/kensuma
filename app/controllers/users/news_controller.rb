module Users
  class NewsController < Users::Base
    def index
      @news_all = News.all
    end

    def show
      @news = News.find(params[:id])
    end
  end
end
