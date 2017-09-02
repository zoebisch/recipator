class IngredientsController < ApplicationController

  get "/ingredients" do
    if is_logged_in?
      erb :"/ingredients/index"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  get "/ingredients/new" do
    if is_logged_in?
      erb :"/ingredients/new"
    else
      flash[:message] = "You must be logged in to add an ingredient"
      redirect to "/login"
    end
  end

  post "/ingredients/new" do
    if is_logged_in?
      @ingredient = Ingredient.find_or_create_by(params[:ingredient])
      redirect to "/ingredients/#{@ingredient.slug}"
    else
      flash[:message] = "You must be logged in to add an ingredient"
      redirect to "/login"
    end
  end

  get "/ingredients/:slug" do
    if is_logged_in?
      @ingredient = Ingredient.find_by_slug(params[:slug])
      erb :"/ingredients/show"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  get "/ingredients/:slug/edit" do
    if is_logged_in? && current_user.username == "site_admin" #Uniqueness established on creation
      @ingredient = Ingredient.find_by_slug(params[:slug])
      erb :"/ingredients/edit"
    else
      flash[:message] = "You must be logged in view the ingredients"
      redirect to "/login"
    end
  end

  post "/ingredients/:slug/edit" do
    if is_logged_in? && current_user.username == "site_admin" #Uniqueness established on creation
      @ingredient = Ingredient.find_by_slug(params[:slug])
      @ingredient.update(params[:ingredient])

      redirect to :"/ingredients/#{@ingredient.slug}"
    else
      flash[:message] = "You must be logged in to edit an ingredient"
      redirect to "/login"
    end
  end

  get '/ingredients/:slug/delete' do
    if is_logged_in? && current_user.name == "site_admin" #Uniqueness established on creation
      ingredient = Ingredient.find_by_slug(params[:slug])
      ingredient.delete
      flash[:message] = "Successfully removed ingredient: #{ingredient.name}"
      redirect to "/ingredients"
    else
      flash[:message] = "Only the admin can delete an ingredient"
      redirect to "/ingredients"
    end
  end

end
