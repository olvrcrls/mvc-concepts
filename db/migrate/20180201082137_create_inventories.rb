class CreateInventories < ActiveRecord::Migration[5.1]
  def change
    create_table :inventories do |t|
      t.integer :product_id
      t.integer :branch_id
      t.integer :stock
      t.decimal :price

      t.timestamps
    end
  end
end
