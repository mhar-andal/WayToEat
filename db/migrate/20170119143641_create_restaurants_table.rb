class CreateRestaurantsTable < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :rating
      t.string :image_url
      t.float :latitude
      t.float :longitude
      t.string :address

      t.timestamps(null: false)
    end
    add_index(:restaurants, :name)
  end
end
