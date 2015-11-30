class AddOrderToLineService < ActiveRecord::Migration
  def change
    add_reference :line_services, :order, index: true, foreign_key: true
  end
end
