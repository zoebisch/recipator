class Culture < ActiveRecord::Base
  has_many :recipes
  has_many :authors, through: :recipes
end
