class CulturesController < ApplicationController

  get "/cultures" do
    if is_logged_in?(session)
      erb :"/cultures/index"
    else
      flash[:message] = "You must be logged in view the cultures"
      redirect to "/login"
    end
  end

  get "/cultures/:slug" do
    if is_logged_in?(session)
      @culture = Culture.find_by_slug(params[:slug])
      binding.pry
      erb :"/cultures/show"
    else
      flash[:message] = "You must be logged in view the cultures"
      redirect to "/login"
    end
  end

end
