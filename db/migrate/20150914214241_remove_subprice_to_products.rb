class RemoveSubpriceToProducts < ActiveRecord::Migration
  def change
    remove_column :products, :subprice, :decimal
  end
end
