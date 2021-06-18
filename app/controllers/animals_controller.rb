class AnimalsController < ApplicationController
  
  # GET: /animals
  get "/animals" do
    if logged_in?
      @list = current_user.animals
      erb :"/animals"
    else
      redirect "/users/login"
    end
  end
  
  
  # GET: /animals/new
  get "/animals/new" do
    erb :"/animals/new"
  end
  
  #  create
  post "/animals" do
    @animal = current_user.animals.build(params)
    if !params[:name].empty? && !params[:animal_type].empty? && !params[:age].empty?
      @animal.save
      redirect "/animals"
    else
      erb :"/animals/new"
    end
  end
  
  get "/animals/:id/edit" do
    @animal = Animal.find_by_id(params[:id])
    if @animal.user == current_user
      erb :"/animals/edit"
    else
      redirect "/animals"
    end
  end
  
  # PATCH: /animals/5
  patch '/animals/:id' do 
    @animal = Animal.find_by_id(params[:id])
    if @animal.user == current_user && !params[:name].empty? && !params[:age].empty? && !params[:animal_type].empty?
      @animal.update(name: params[:name], age: params[:age], animal_type: params[:animal_type])
    end
    redirect "/animals"
  end
  
  # DELETE: /animals/5/delete
  delete "/animals/:id" do
    @animal = Animal.find_by_id(params[:id])
    if @animal.user == current_user
      @animal.delete
    end
    redirect "/animals"
  end
  
  #show
  get "/animals/:id" do
    @animal = Animal.find_by_id(params[:id])
    #if id that doesnt exist in the db - redirect
    if !@animal
      redirect "/animals"
    end
      erb :"/animals/show"
  end
end
