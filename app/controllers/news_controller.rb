class NewsController < ApplicationController
    
    def post_news
        byebug
        news = News.new(request.body)
        news.news_image.attach(params)
        news.save
        render json: {news: news.news_image}
    end

    private

    def news_params
        params.require(:news).permit(:title, :news_image, :description, :user_id, :filename)
    end
end
