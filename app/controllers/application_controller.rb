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

end
