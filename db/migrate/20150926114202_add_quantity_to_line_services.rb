class AddQuantityToLineServices < ActiveRecord::Migration
  def change
    add_column :line_services, :quantity, :integer, default: 1
  end
end
