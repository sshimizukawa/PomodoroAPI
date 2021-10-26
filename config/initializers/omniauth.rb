Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
           skip_jwt: true, 
           prompt: "consent", 
           callback_path: "/auth/google_oauth2/callback", 
         } 

end 
OmniAuth.config.allowed_request_methods = %i[get] 
OmniAuth.config.full_host = Rails.env.production? ? 'https://www.syykz.net' : 'http://localhost:3000' 