class IngredientsController < ApplicationController

  get "/ingredients" do
    if is_logged_in?(session)
      erb :"/ingredients/index"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  get "/ingredients/new" do
    if is_logged_in?(session)
      erb :"/ingredients/new"
    else
      flash[:message] = "You must be logged in to add an ingredient"
      redirect to "/login"
    end
  end

  post "/ingredients/new" do
    if is_logged_in?(session)
      @ingredient = Ingredient.find_or_create_by(params[:ingredient])
      redirect to "/ingredients/#{@ingredient.slug}"
    else
      flash[:message] = "You must be logged in to add an ingredient"
      redirect to "/login"
    end
  end

  get "/ingredients/:slug" do
    if is_logged_in?(session)
      @ingredient = Ingredient.find_by_slug(params[:slug])
      binding.pry
      erb :"/ingredients/show"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  get "/ingredients/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @ingredient = Ingredient.find_by_slug(params[:slug])
      erb :"/ingredients/edit"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  post "/ingredients/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @ingredient = Ingredient.find_by_slug(params[:slug])
      binding.pry
      @ingredient.update(params[:ingredient])

      redirect to :"/ingredients/#{@ingredient.slug}"
    else
      flash[:message] = "You must be logged in to edit an ingredient"
      redirect to "/login"
    end
  end

end
