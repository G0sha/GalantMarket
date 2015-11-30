class CreateLineSolutionsItems < ActiveRecord::Migration
  def change
    create_table :line_solutions_items do |t|
      t.references :product, index: true, foreign_key: true
      t.belongs_to :solution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
