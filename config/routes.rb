Rails.application.routes.draw do
  resource :samples

  get "/patients/:id", to: "patients#show", as: "patient"
  get "/users/auth/google_oauth2/callback", to: "users/omniauth_callbacks#google_oauth2"
end