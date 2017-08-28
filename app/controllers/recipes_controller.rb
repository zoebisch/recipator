class RecipesController < ApplicationController

  get "/recipes" do
    if is_logged_in?(session)
      erb :"/recipes/index"
    else
      flash[:message] = "You must be logged in view the recipes"
      redirect to "/login"
    end
  end

  get "/recipes/new" do
    if is_logged_in?(session)
      erb :"/recipes/new"
    else
      flash[:message] = "You must be logged in to create a recipe"
      redirect to "/login"
    end
  end

  post "/recipes/new" do
    if is_logged_in?(session)

      binding.pry
      @recipe = Recipe.find_or_create_by(params[:recipe])
      if params[:culture][:name] != ""
        @recipe.culture = Culture.find_or_create_by(params[:culture])
      end

      if params[:author][:name] != ""
        @recipe.author = Author.find_or_create_by(params[:author])
      end
      
      if params[:ingredient] != []
        params[:ingredient][:name].split(",").each do |ingredient|
          binding.pry
          @recipe.ingredients << Ingredient.find_or_create_by({:name => ingredient})
        end
      end
      # if params[:recipe][:name] != ""
      #   @recipe = Recipe.create(params[:recipe])
      #   if params[:culture]
      #   @recipe.culture<< Culture.create(params[:title])
      # end
      # if params[:landmark][:name] != ""
      #   @recipe.landmarks << Landmark.create(params[:landmark])
      # end
      # @recipe.save
      # params[:ingredient][:name].each do |ingredient|
      #   Ingredient.find_or_create_by({:name => ingredient})
      # end
    else
      flash[:message] = "You must be logged in to create a recipe"
      redirect to "/login"
    end
  end

  get "/recipes/:slug" do
    if is_logged_in?(session)
      @recipe= Recipe.find_by_slug(params[:slug])
      binding.pry
      erb :"/recipes/show"
    else
      flash[:message] = "You must be logged in view the recipes"
      redirect to "/login"
    end
  end


end
