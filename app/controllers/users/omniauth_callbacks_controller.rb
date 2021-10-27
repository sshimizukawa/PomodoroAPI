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
      # @todo: 環境変数に定義 
      redirect_url = Rails.env.production? ? 'https://www.syykz.net' : 'http://localhost:1234' 
      return redirect_to redirect_url
    else
      render json: { status: "failed" }
    end
  end

  def failure
    render json: { status: "fail" }
  end
end
