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
      @recipe = Recipe.find_or_create_by(params[:name])
      @culture = Culture.find_or_create_by(params[:culture])
      @author = Author.find_or_create_by(params[:author])
      # params[:ingredient][:name].each do |ingredient|
      #   Ingredient.find_or_create_by({:name => ingredient})
      # end

      binding.pry
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
