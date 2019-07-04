class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :code
      t.decimal :price
      t.integer :category_product_id, foreign_key: true

      t.timestamps
    end
  end
end
