class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :full_name
      t.string :username
      t.string :password_digest
      t.string :account_type
      t.decimal :credits
      t.integer :contact_number
      t.string :email_address

      t.timestamps
    end
  end
end
