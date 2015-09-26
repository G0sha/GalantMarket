class CreateLineServices < ActiveRecord::Migration
  def change
    create_table :line_services do |t|
      t.references :service, index: true, foreign_key: true
      t.belongs_to :cart, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
