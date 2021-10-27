Rails.application.routes.draw do
  scope :api do
    resource :music_sessions
    get "/users/mydata", to: "users/mydata#show"
  end
  # カスタムエンドポイント非推奨のため
  get "/auth/google_oauth2/callback", to: "users/omniauth_callbacks#google_oauth2"
end