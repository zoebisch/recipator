class Ingredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string  :name
      t.string  :description
      t.string  :origin
      t.integer :quantity
      t.string  :quantity_type
    end
  end
end
