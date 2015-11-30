class AddQuantityToLineSolutionsItems < ActiveRecord::Migration
  def change
    add_column :line_solutions_items, :quantity, :integer, default: 1
  end
end
