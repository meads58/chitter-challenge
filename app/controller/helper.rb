class ChitterApp < Sinatra::Base

  helpers do
    def current_user
      @current_user ||=User.get(session[:user_id]) if session[:user_id]
    end
  end

   def user_create
    User.create(:email => params[:email],
              :user_name => params[:user_name],
              :name => params[:name],
              :password => params[:password],
              :password_confirmation => params[:password_confirmation])
  end

end