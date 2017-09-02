class User < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  validates_presence_of :name, :email
  validates_uniqueness_of :name, :email
  has_secure_password
  has_many :user_recipes, :class_name => "User_Recipe"
  has_many :recipes, through: :user_recipes
end
