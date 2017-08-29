class CulturesController < ApplicationController

  get "/cultures" do
    if is_logged_in?(session)
      erb :"/cultures/index"
    else
      flash[:message] = "You must be logged in view the cultures"
      redirect to "/login"
    end
  end

  get "/cultures/new" do
    if is_logged_in?(session)
      erb :"/cultures/new"
    else
      flash[:message] = "You must be logged in to add an culture"
      redirect to "/login"
    end
  end

  post "/cultures/new" do
    if is_logged_in?(session)
      @culture = Culture.find_or_create_by(params[:culture])
      redirect to "/cultures/#{@culture.slug}"
    else
      flash[:message] = "You must be logged in to add an culture"
      redirect to "/login"
    end
  end

  get "/cultures/:slug" do
    if is_logged_in?(session)
      @culture = Culture.find_by_slug(params[:slug])
      erb :"/cultures/show"
    else
      flash[:message] = "You must be logged in view the cultures"
      redirect to "/login"
    end
  end

  get "/cultures/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @culture = Culture.find_by_slug(params[:slug])
      erb :"/cultures/edit"
    else
      flash[:message] = "You must be logged in view the cultures"
      redirect to "/login"
    end
  end

  post "/cultures/:slug/edit" do
    if is_logged_in?(session) && current_user(session).username == "site_admin" #Uniqueness established on creation
      @culture = Culture.find_by_slug(params[:slug])
      binding.pry
      @culture.update(params[:culture])

      redirect to :"/cultures/#{@culture.slug}"
    else
      flash[:message] = "You must be logged in to edit an culture"
      redirect to "/login"
    end
  end


end
