class Recipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |t|
      t.string  :name
      t.string  :instructions
      t.integer :total_time
      t.integer :author_id
      t.integer :culture_id
    end
  end
end
