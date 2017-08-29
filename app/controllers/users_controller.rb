class UsersController < ApplicationController

  get "/users/:id/show" do
    @user = current_user(session)
    erb :"/users/show"
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
      if params[:recipe] != nil
        recipe_array = params[:recipe].split(" ")
        @recipe = Recipe.find_by_name(recipe_array[1])
        if recipe_array[0] == "Add"
          @user.recipes << @recipe
        else
          @user.recipes.delete(@recipe)
        end
      end
      @user.save
      
      @user.update(params[:user]) if params[:user]

      redirect to :"/users/#{@user.slug}/show"
    else
      flash[:message] = "You must be logged in to edit a profile"
      redirect to "/login"
    end
  end

end
