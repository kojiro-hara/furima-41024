class AddPriceToBuys < ActiveRecord::Migration[7.1]
  def change
    add_column :buys, :price, :integer
  end
end
