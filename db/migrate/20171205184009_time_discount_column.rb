class TimeDiscountColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :discount_end, :datetime
  end
end
