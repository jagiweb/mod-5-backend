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
            description3: about.description3,
            id: about.id
            }}
        render json:{ about: about}
    end

    def show
        about = About.find_by(id: params[:id])
        if about 
            render json: {about: about}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def update
        about = About.find_by(id: params[:id])
        
        if about
            about.update(about_params)
            render json: {about: about}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def destroy
        about = About.find_by(id: params[:id])

        if about
            about.destroy
            render json: {message: "Success"}
        else
            render json: {message: "NOT WORKING"}
        end
    end

    private

    def about_params
        params.permit(:title, :about_image, :description, :description2, :description3)
    end
end
