class Recipe < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  belongs_to :author
  belongs_to :culture #(Most have only one, for purist reasons we will decide on ONE)
  has_many :recipe_ingredients, :class_name => 'Recipe_Ingredients'
  has_many :ingredients, through: :recipe_ingredients
end
