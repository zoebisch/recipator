class UsersController < ApplicationController

  get "/users/:id/show" do
    if is_logged_in?(session)
      @user = current_user(session)
      erb :"/users/show"
    else
      flash[:message] = "You must be logged in to view your page"
      redirect to "/login"
    end
  end

  get "/users/new" do
    erb :"/users/new"
  end

  get "/users/:slug/edit" do
    if is_logged_in?(session)
      @user = User.find_by_slug(params[:slug])
      erb :"/users/edit"
    else
      flash[:message] = "You must be logged in to edit a profile"
      redirect to "/login"
    end
  end

  post "/users/:slug/edit" do
    if is_logged_in?(session)
      @user = User.find_by_slug(params[:slug])
      if params[:user]
        params[:user][:recipe_ids].each do |id|
          @user.recipes.delete(id)
        end
        @user.save
      end
      if params[:recipe_add_remove] != nil
        recipe_name = params[:recipe_add_remove].split("Add ")[1] || params[:recipe_add_remove].split("Remove ")[1]
        @recipe = Recipe.find_by_name(recipe_name)
        if params[:recipe_add_remove].split(" ")[0] == "Add"
          @user.recipes << @recipe
        else
          @user.recipes.delete(@recipe)
        end
      end
      @user.save
      redirect to :"/users/#{@user.slug}/show"
    else
      flash[:message] = "You must be logged in to edit a recipe collection"
      redirect to "/login"
    end
  end

end
