class Users::MydataController < ApplicationController
    before_action :init

    def init
        @user_id = session[:user_id]
        @user = currentUser(@user_id)
    end

    def show
        name = @user.email.split("@")[0]
        if name.length > 15 then name = name.slice(0, 15) + "..." end

        response_success({name: name})
    end
end