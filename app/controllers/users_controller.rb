class UsersController < ApplicationController

  get "/users/:id/show" do
    @user = current_user(session)
    erb :"/users/show"
  end

end
