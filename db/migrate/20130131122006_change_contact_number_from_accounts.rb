class ChangeContactNumberFromAccounts < ActiveRecord::Migration
  def up
  	remove_column :accounts, :contact_number
  	add_column :accounts, :contact_number, :string
  end

  def down
  	remove_column :accounts, :contact_number
  	add_column :accounts, :contact_number, :string
  end
end
