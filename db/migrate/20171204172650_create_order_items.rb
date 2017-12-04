class CreateOrderItems < ActiveRecord::Migration[5.0]
  def change
    create_table :order_items do |t|
      t.column :order_id, :integer
      t.column :product_id, :integer
      t.column :quantity, :integer
      t.column :reserved_price, :integer
      
      t.timestamps
    end
  end
end
