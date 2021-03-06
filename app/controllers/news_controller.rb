class NewsController < ApplicationController
    
    def post_news
        news = News.create(news_params)
        render json: {image_url: url_for(news.news_image), news: news}
    end

    def all_news
        news = News.all
        if news.length > 20
            news.first destroy
        end
        news = news.map {|news| {image_url: url_for(news.news_image), title: news.title, description: news.description, id: news.id}}
        render json:{ news: news.last(4)}
    end

    def all_news_admin
        news = News.all
        news = news.map {|news| {image_url: url_for(news.news_image), title: news.title, description: news.description, id: news.id}}
        render json:{news: news}
    end

    def show_four_more
        i = 2
        news = News.all
        if news.length > 4
            news = news.map {|news| {image_url: url_for(news.news_image), title: news.title, description: news.description, id: news.id}}
            render json:{news: news.slice(i, i + 2)}
            i = i + 2
        else
            news = news.map {|news| {image_url: url_for(news.news_image), title: news.title, description: news.description, id: news.id}}
            render json:{news: news}
        end
    end

    def show
        news = News.find_by(id: params[:id])
        if news 
            render json: {news: news}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def update
        news = News.find_by(id: params[:id])
        
        if news
            news.update(news_params)
            render json: {news: news}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def destroy
        news = News.find_by(id: params[:id])

        if news
            news.destroy
            render json: {message: "Success"}
        else
            render json: {message: "NOT WORKING"}
        end
    end

    private

    def news_params
        params.permit(:title, :news_image, :description, :user_id)
    end
end
