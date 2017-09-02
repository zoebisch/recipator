class Ingredient < ActiveRecord::Base
    include Concerns::InstanceMethods
    extend Concerns::ClassMethods
    has_many :recipe_ingredients, :class_name => 'Recipe_Ingredient' #ActiveRecord was refusing to initialize constant?
    has_many :recipes, through: :recipe_ingredients
end
