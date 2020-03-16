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
            description3: care.description3
            }}
        render json:{care: cares}
    end

    private

    def care_params
        params.permit(:title, :description, :description2, :description3)
    end

end
