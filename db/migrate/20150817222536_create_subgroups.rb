class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
