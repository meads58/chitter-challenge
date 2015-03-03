class ChitterApp < Sinatra::Base

  post '/peeps' do
    params["reply"].empty?
    peep = params["peep"]
    Peep.create(:peep => peep, :entry_time=> Time.now, :user_id => session[:user_id])
    redirect to('/peeps')
  end

  get'/peeps' do
    @peep = Peep.all(:order => [:entry_time.desc])
    erb :peeps
  end

  post '/reply' do
    session[:reply] = params[:post]
    redirect to('/reply')
  end

  get '/reply' do
    @reply_to = session[:reply]
    erb :reply
  end

end

