class UsersController < ApplicationController
  get "/users/new" do
    erb :"users/new.html"
  end

  post "/users/new" do
    binding.pry
    user = User.create(email: params["email"], password: params["password"]) #creates a new user after form is submitted
    if user.email.blank? || !u.password.blank? || User.find_by_email(params["email"])
    session[:user_id] = user.id
    redirect "/users/new"
    else
      user.save
      session[:user_id] = user.id
      redirect '/animals'
    end
  end
end
