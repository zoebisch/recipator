class Recipe < ActiveRecord::Base
  belongs_to :author
  belongs_to :culture #(Most have only one, for purist reasons we will decide on ONE)
  has_many :ingredients
end
