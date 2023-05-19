class AddNotNullColumnsToOrder < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :firstname, false
    change_column_null :orders, :lastname, false
    change_column_null :orders, :address, false
    change_column_null :orders, :phone, false
  end
end
