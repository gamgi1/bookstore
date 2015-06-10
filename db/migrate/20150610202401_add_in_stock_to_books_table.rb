class AddInStockToBooksTable < ActiveRecord::Migration
  def change
    add_column :books, :in_stock, :integer
  end
end
