class NewsController < ApplicationController
    def post_news
        news = News.create(news_params)
        render json: {news: news.news_image}
    end

    private

    def news_params
        params.require(:news).permit(:title, :news_image, :description, :user_id, :filename)
    end
end
