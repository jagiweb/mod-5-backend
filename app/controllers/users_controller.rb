class UsersController < ApplicationController
    def admin_signin
        user = User.find_by(username: params[:username])
        if user.admin_signin && user.authenticate(password: params[:password])
            render json: {user: user}
        end
    end
end
