class AddShowToSubgroup < ActiveRecord::Migration
  def change
    add_column :subgroups, :show, :boolean
  end
end
