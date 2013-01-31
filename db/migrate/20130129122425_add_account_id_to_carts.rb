class AddAccountIdToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :account_id, :integer
  end
end
