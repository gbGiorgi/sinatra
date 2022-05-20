require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "ToDo secret"

    get "/" do
      erb :sign_in
    end

    helpers do
      def redirect_if_not_logged_in
        if !logged_in?
          redirect "/login?error=You have to be logged in to do that"
        end
      end

      def logged_in?
        !!session[:id]
      end

      def current_user
        @current_user = User.find_by_id(session[:id])
      end
    end
  end
end