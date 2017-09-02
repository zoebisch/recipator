require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "NachoMamma137!"
  end

  get "/" do
    if is_logged_in?
      @user = current_user
      erb :'index'
    else
      redirect to '/login'
    end
  end

  get '/signup' do
    erb :"/users/new"
  end

  post '/signup' do
    user = User.new(:name => params[:name], :email => params[:email], :password => params[:password])
    if user.save
      session[:user_id] = user.id
      redirect to "/"
    else
      if is_logged_in?
        redirect to "/"
      else
        flash[:message] = user.errors.full_messages.join(', ')
        redirect to "/signup"
      end
    end
  end

  get '/login' do
    if is_logged_in?
      redirect to "/"
    end
    flash[:message] = "Please Log In to browse the Recipator"
    erb :"/users/login"
  end

  post '/login' do
    user = User.find_by(:name => params[:name])
    if user && user.authenticate(params[:password])
      flash[:message] = "Welcome, #{user.name}!"
      session[:user_id] = user.id
      redirect to "/"
    else
      flash[:message] = "Invalid username or password"
      erb :"/users/login"
    end
  end

  get '/logout' do
    if is_logged_in?
      session.clear
      redirect to '/login'
    else
      redirect to '/'
    end
  end

  private

    def current_user
      User.find_by_id(session[:user_id])
    end

    def is_logged_in?
      !!session[:user_id]
    end

end
