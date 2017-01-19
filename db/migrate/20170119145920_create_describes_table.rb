class CreateDescribesTable < ActiveRecord::Migration
  def change
    create_table :describes do |t|
      t.integer :category_id
      t.integer :restaurant_id

      t.timestamps(null: false)
    end
  end
end
