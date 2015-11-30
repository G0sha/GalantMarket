class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :sol_img

      t.timestamps null: false
    end
  end
end
