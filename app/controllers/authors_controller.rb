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
      binding.pry
      erb :"/authors/show"
    else
      flash[:message] = "You must be logged in view the authors"
      redirect to "/login"
    end
  end


end
