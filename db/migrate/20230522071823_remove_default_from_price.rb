class RemoveDefaultFromPrice < ActiveRecord::Migration[7.0]
  def change
    change_column_default :products, :price, nil
  end
end
