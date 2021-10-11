class Users::OmniauthCallbacksController < ApplicationController
  include ActionController::Cookies

  def google_oauth2
    callback_for(:google)
  end

  def callback_for(provider)
    @omniauth = request.env["omniauth.auth"]
    info = User.find_oauth(@omniauth)
    @user = info[:user]

    if @user.persisted?
      session[:user_id] = info[:user].id
      return redirect_to "http://localhost:1234/"
    else
      render json: { status: "failed" }
    end
  end

  def failure
    render json: { status: "fail" }
  end
end
