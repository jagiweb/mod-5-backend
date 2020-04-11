class WorksController < ApplicationController
    def post_work
        work = Work.create(work_params)
        render json: {image_url: url_for(work.work_image), work: work}
    end

    def all_work
        works = Work.all
        if works.length > 20
            works.first.destroy
        end
        works = works.map {|work| {image_url: url_for(work.work_image), title: work.title, id: work.id}}
        render json:{works: works.last(8)}
    end

    def all_works_admin
        works = Work.all
        works = works.map {|work| {image_url: url_for(work.work_image), title: work.title, id: work.id}}
        render json:{works: works}
    end

    def show_four_more
        i = 4
        works = Work.all
        works = works.map{ |work| {image_url: url_for(work.work_image), title: work.title, id: work.id}}
        render json:{works: works.slice(i,   i+4)}
        i = i + 4
    end

    def show
        work = Work.find_by(id: params[:id])
        if work 
            render json: {work: work}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def update
        work = Work.find_by(id: params[:id])
        
        if work
            work.update(work_params)
            render json: {work: work}
        else
            render json:{error: "NOT WORKING"}
        end
    end

    def destroy
        work = Work.find_by(id: params[:id])

        if work
            work.destroy
            render json: {message: "Success"}
        else
            render json: {message: "NOT WORKING"}
        end
    end

    private

    def work_params
        params.permit(:title, :work_image, :user_id)
    end
end
