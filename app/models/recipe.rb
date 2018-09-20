class Recipe < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  belongs_to :culture #(Most have only one, for purist reasons we will decide on ONE)
  has_many :recipe_ingredients, :class_name => "Recipe_Ingredient"
  has_many :ingredients, through: :recipe_ingredients
  has_many :user_recipes, :class_name => "User_Recipe"
  has_many :users, through: :user_recipes

  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
end
