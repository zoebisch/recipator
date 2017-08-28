class Culture < ActiveRecord::Base
  include Concerns::InstanceMethods
  extend Concerns::ClassMethods
  has_many :recipes
  has_many :authors, through: :recipes
end
