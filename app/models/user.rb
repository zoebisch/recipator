class User < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  validates_presence_of :name, :email, :password
  validates_uniqueness_of :name
  has_secure_password
  has_many :user_recipes, :class_name => 'User_Recipes'
  has_many :recipes, through: :user_recipes
end
