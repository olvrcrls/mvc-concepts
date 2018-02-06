class AddSlugToBrands < ActiveRecord::Migration[5.1]
  def change
    add_column :brands, :slug, :string
  end
end
