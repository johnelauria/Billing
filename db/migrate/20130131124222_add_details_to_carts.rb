class AddDetailsToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :status, :string
    add_column :carts, :date_purchased, :date
    add_column :carts, :time_purchased, :time
  end
end
