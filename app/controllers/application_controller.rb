require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'supernatural_secret'
  end

  get "/" do
    erb :"welcome"
  end

  get "/hunters" do
    if logged_in?
      redirect "/hunters/#{current_user.id}"
    else
      redirect "/"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= Hunter.find_by(id: session[:user_id])
    end
  end

end
