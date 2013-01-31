class AddDefaultToCredits < ActiveRecord::Migration
  def up
    remove_column :accounts, :credits
    add_column :accounts, :credits, :decimal, null: false, default: 0
  end

  def down
    add_column :accounts, :credits, :decimal
    remove_column :accounts, :credits
  end
end
