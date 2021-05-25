class UsersController < ApplicationController
  get "/users/new" do #sign up form
    erb :"users/new.html"
  end

  post "/users/new" do
    user = User.new(username: params["username"], password: params["password"]) #creates a new user after form is submitted
    if user.username.blank? || user.password.blank? || User.find_by_username(params["username"])
    redirect "/users/new"
    else
      user.save
      session[:user_id] = user.id
      redirect '/animals'
    end
  end

  get "/users/login" do #login form
    erb :"users/login"
  end

  post "/users/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/animals"
    else
      redirect "/users/login"
    end
  end

  get '/users/logout' do
    session.clear
    redirect '/'
  end
end
