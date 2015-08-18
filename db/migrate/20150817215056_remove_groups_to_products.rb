class RemoveGroupsToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :group, :integer
    remove_column :products, :subgroup, :integer
  end
end
