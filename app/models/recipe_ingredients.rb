class RecipeIngredients < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  belongs_to :recipe
  belongs_to :ingredient
end
