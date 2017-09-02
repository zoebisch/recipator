class User_Recipe < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
end
