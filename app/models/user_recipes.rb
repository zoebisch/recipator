class User_Recipes < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
end
