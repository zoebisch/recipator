class Author < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  has_many :recipes
end
