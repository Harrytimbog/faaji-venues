class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.text :description
      t.integer :price
      t.string :name
      t.string :address
      t.string :image
      t.string :category
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
