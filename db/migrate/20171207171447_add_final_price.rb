class AddFinalPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :final_price, :integer
  end
end
