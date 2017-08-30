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
      @recipe = Recipe.find_or_create_by({:name => params[:recipe][:name]})
      @recipe.update(params[:recipe])

      if params[:culture][:name] != ""
        @recipe.culture = Culture.find_or_create_by(params[:culture])
      end

      if params[:author][:name] != ""
        @recipe.author = Author.find_or_create_by(params[:author])
      end

      if params[:ingredient] != []
        params[:ingredient][:name].split(",").each do |ingredient|
          @recipe.ingredients << Ingredient.find_or_create_by({:name => ingredient})
        end
      end
      @recipe.save
      flash[:message] = "Successfully created #{@recipe.name}"
      redirect to :"/recipes/#{@recipe.slug}"
    else
      flash[:message] = "Only the admin can edit a recipe"
      redirect to "/login"
    end
  end

  get "/recipes/:slug" do
    if is_logged_in?(session)
      @recipe= Recipe.find_by_slug(params[:slug])
      @user = current_user(session)
      erb :"/recipes/show"
    else
      flash[:message] = "You must be logged in view the recipes"
      redirect to "/login"
    end
  end

  post "/recipes/:slug/edit" do
    if is_logged_in?(session) && current_user(session).name == "site_admin" #Uniqueness established on creation
      @recipe = Recipe.find_by_slug(params[:slug])
      @recipe.update(params[:recipe])

      if params[:culture][:name] != ""
        @recipe.culture = Culture.find_or_create_by(params[:culture])
      end

      if params[:author][:name] != ""
        @recipe.author = Author.find_or_create_by(params[:author])
      end

      if params[:ingredient] != []
        params[:ingredient][:name].split(",").each do |ingredient|
          @recipe.ingredients << Ingredient.find_or_create_by({:name => ingredient})
        end
      end
      @recipe.save
      flash[:message] = "Successfully updated #{@recipe.name}"

      redirect to :"/recipes/#{@recipe.slug}"
    else
      flash[:message] = "Only the admin can edit a recipe"
      redirect to "/login"
    end
  end

  get "/recipes/:slug/edit" do
    if is_logged_in?(session) && current_user(session).name == "site_admin" #Uniqueness established on creation
      @recipe = Recipe.find_by_slug(params[:slug])
      erb :"/recipes/edit"
    else
      flash[:message] = "Only the admin can edit a recipe"
      redirect to "/login"
    end
  end

  post '/recipes/:slug/delete' do
    recipe = Recipe.find_by_slug(params[:slug])
    if is_logged_in?(session) && current_user(session).name == "site_admin" #Uniqueness established on creation
      recipe.delete
      redirect to "/recipes"
    else
      flash[:message] = "Only the admin can delete an recipe"
      redirect to "/recipes/#{recipe.slug}"
    end
  end

end
