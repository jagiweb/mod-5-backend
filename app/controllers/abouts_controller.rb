class AboutsController < ApplicationController

    def post_about
        about = About.create(about_params)
        render json: {image_url: url_for(about.about_image), about: about}
    end

    def all_about
        about = About.all
        about = about.map {|about| {
            image_url: url_for(about.about_image),
            title: about.title,
            description: about.description,
            description2: about.description2,
            description3: about.description3
            }}
        render json:{ about: about}
    end

    private

    def about_params
        params.permit(:title, :about_image, :description, :description2, :description3)
    end
end
