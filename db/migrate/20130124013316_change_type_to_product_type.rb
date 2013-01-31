class ChangeTypeToProductType < ActiveRecord::Migration
  def up
    remove_column :products, :type
    add_column :products, :product_type, :string
  end

  def down
    add_column :products, :type, :string
    remove_column :products, :type
  end
end
