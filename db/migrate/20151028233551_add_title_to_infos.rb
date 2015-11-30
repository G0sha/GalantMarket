class AddTitleToInfos < ActiveRecord::Migration
  def change
    add_column :infos, :title, :string
  end
end
