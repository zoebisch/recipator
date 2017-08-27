class Cultures < ActiveRecord::Migration[5.1]
  def change
    create_table :cultures do |t|
      t.string :name
    end
  end
end
