class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.integer :group
      t.integer :subgroup
      t.text :description
      t.decimal :price
      t.decimal :subprice

      t.timestamps null: false
    end
  end
end
