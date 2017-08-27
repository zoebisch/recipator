class UsersController < ApplicationController

  get "/users/:id/show" do
    erb :"/users/show"
  end

end
