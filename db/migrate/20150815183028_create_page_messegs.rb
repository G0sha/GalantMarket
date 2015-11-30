class CreatePageMessegs < ActiveRecord::Migration
  def change
    create_table :page_messegs do |t|
      t.string :title
      t.text :description
      t.string :cover

      t.timestamps null: false
    end
  end
end
