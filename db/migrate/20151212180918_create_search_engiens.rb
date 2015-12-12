class CreateSearchEngiens < ActiveRecord::Migration
  def change
    create_table :search_engiens do |t|
      t.string :title
      t.text :head
      t.text :footer

      t.timestamps null: false
    end
  end
end
