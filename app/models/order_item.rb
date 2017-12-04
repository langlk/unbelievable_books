class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates_presence_of :order, :product, :quantity, :reserved_price
end
