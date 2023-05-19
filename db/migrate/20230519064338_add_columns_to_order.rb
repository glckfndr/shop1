class AddColumnsToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :firstname, :string
    add_column :orders, :lastname, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
  end
end
