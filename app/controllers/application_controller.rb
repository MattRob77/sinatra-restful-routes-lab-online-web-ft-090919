class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/recipes' do 
    @recipes = Recipe.all 
    erb:index
  end 
  
  get '/recipes/new' do
    erb :new
  end 
  
   post '/recipes' do
    @recipe = Recipe.new(params)
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      redirect '/recipes/new'
    end
  end
  
  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    if @recipe 
      erb :edit 
    else 
      redirect '/recipes'
    end 
  end 
  
    patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    name = params[:name]
    ingredients = params[:ingredients]
    cook_time = params[:cook_time]
    if @recipe.update(name: name, ingredients: ingredients, cook_time: cook_time)
      redirect "/recipes/#{@recipe.id}"
    else
      redirect "/recipes"
    end
  end
  
  delete '/recipes/:id' do 
    recipe = Recipe.find_by_id(params[:id])
    recipe.destroy
    redirect '/recipes'
  end 
  

end
