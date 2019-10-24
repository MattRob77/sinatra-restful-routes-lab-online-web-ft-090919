class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get /recipes do 
    @recipes = Recipe.all 
    erb:index
  end 
  
  get /recipe do 
    erb:index
  end 
  
  post /recipe
    

end
