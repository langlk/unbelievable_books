class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates_presence_of :order, :product, :quantity
  before_save :reserve_price
  after_save :update_order_total
  after_destroy :update_order_total

  def reserve_price
    self.reserved_price = product.price
  end

  def update_order_total
    self.order.save
  end
end
