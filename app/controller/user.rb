require_relative 'helper'

class ChitterApp < Sinatra::Base

  get '/user/new' do
    flash[:notice] = nil
    flash[:errors] = nil
    @user = User.new
    erb :new_user
  end

  post '/user/new' do
    @user = user_create
    if @user.save
      session[:user_id] = @user.id
      redirect to('/peeps')
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :new_user
    end
  end

  post '/user' do

  end

end