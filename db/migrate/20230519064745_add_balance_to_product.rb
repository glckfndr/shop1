class AddBalanceToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :balance, :integer
  end
end
