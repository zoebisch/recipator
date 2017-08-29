class Author < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  validates_presence_of :name
  has_many :recipes
end
