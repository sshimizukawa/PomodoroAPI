Rails.application.routes.draw do
  resource :music_sessions
  
  get "/users/mydata", to: "users/mydata#show"
  get "/users/auth/google_oauth2/callback", to: "users/omniauth_callbacks#google_oauth2"
end