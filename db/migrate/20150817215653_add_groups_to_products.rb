class AddGroupsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :group_id, :integer
    add_column :products, :subgroup_id, :integer
    add_index :products, [:group_id, :subgroup_id, :created_at]
  end
end
