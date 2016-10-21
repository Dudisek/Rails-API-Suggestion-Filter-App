class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :image
      t.integer :category

      t.timestamps
    end
  end
end
