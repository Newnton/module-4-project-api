class CreateListings < ActiveRecord::Migration[5.1]
  def change
    create_table :listings do |t|
      t.string :address
      t.integer :zipcode
      t.integer :bedrooms
      t.integer :sqft
      t.float :price
      t.integer :bathrooms
      t.string :type
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end