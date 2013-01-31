class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.string :type, null: false
      t.decimal :price, default: 0, null: false

      t.timestamps
    end
  end
end
