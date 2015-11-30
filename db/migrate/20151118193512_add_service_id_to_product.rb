class AddServiceIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :service_id, :integer
  end
end
