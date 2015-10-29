class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.text :description
      t.string :info_img

      t.timestamps null: false
    end
  end
end
