class WorksController < ApplicationController
    def post_work
        work = Work.create(work_params)
        render json: {image_url: url_for(work.work_image), work: work}
    end

    def all_work
        works = Work.all
        works = works.map {|work| {image_url: url_for(work.work_image), title: work.title}}
        render json:{works: works}
    end

    private

    def work_params
        params.permit(:title, :work_image, :user_id)
    end
end
