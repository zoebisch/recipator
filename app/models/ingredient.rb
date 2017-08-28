class Ingredient < ActiveRecord::Base
    include Concerns::InstanceMethods
    extend Concerns::ClassMethods
    has_many :recipe_ingredients, :class_name => 'Recipe_Ingredients'
    has_many :recipes, through: :recipe_ingredients
end
