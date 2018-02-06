class CreateGenerates < ActiveRecord::Migration[5.1]
  def change
    create_table :generates do |t|
      t.string :Brand
      t.string :name

      t.timestamps
    end
  end
end
