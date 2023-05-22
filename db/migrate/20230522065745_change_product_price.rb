class ChangeProductPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :decimal, precision: 8, scale: 2, null: false
    add_check_constraint :products, 'price >= 0', name: 'price_non_negative'
  end
end
