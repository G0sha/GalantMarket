class AddShowToGroup < ActiveRecord::Migration
  def change
    add_column :groups, :show, :boolean
  end
end
