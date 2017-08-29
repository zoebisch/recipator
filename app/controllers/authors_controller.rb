class AuthorsController < ApplicationController

  get "/authors" do
    if is_logged_in?(session)
      erb :"/authors/index"
    else
      flash[:message] = "You must be logged in view the authors"
      redirect to "/login"
    end
  end

  get "/authors/:slug" do
    if is_logged_in?(session)
      @author = Author.find_by_slug(params[:slug])
      erb :"/authors/show"
    else
      flash[:message] = "You must be logged in view the authors"
      redirect to "/login"
    end
  end

  get "/authors/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @author = Author.find_by_slug(params[:slug])
      erb :"/authors/edit"
    else
      flash[:message] = "You must be logged in view the authors"
      redirect to "/login"
    end
  end

  post "/authors/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @author = Author.find_by_slug(params[:slug])
      binding.pry
      @author.update(params[:author])

      redirect to :"/authors/#{@author.slug}"
    else
      flash[:message] = "You must be logged in to edit an author"
      redirect to "/login"
    end
  end


end
