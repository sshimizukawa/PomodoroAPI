class ApplicationController < ActionController::API
  include ActionController::Cookies

  def response_success(response_json = {})
    render status: 200, json: { status: 200, message: "ok" }.merge(response_json)
  end

  def response_bad_request(message = "Bad Request")
    render status: 400, json: { status: 400, message: message }
  end

  def response_unauthorized(message = "Unauthorized")
    render status: 401, json: { status: 401, message: message }
  end

  def currentUser(user_id)
    if user_id.nil? then return response_unauthorized("ログインしてください") end

    user = User.find(user_id)
    if user.nil? then return response_unauthorized("ユーザを登録してください") end

    return user
  end
end
