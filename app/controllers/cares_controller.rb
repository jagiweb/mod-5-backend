class CaresController < ApplicationController

    def post_care
        care = Care.create(care_params)
        render json: {care: care}
    end

    def all_care
        cares = Care.all
        cares = cares.map {|care| {
            title: care.title,
            description: care.description,
            description2: care.description2,
            description3: care.description3,
            id: care.id
            }}
        render json:{care: cares}
    end

    def show
        care = Care.find_by(id: params[:id])
        if care 
            render json: {care: care}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def update
        care = Care.find_by(id: params[:id])
        byebug
        if care
            care.update(care_params)
            render json: {care: care}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def destroy
        care = Care.find_by(id: params[:id])

        if care
            care.destroy
            render json: {message: "Success"}
        else
            render json: {message: "NOT WORKING"}
        end
    end

    private

    def care_params
        params.permit(:title, :description, :description2, :description3)
    end

end
