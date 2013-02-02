class AddPaymentMethodToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :payment_method, :string
  end
end
