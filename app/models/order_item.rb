class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates_presence_of :order, :product, :quantity
  before_create :reserve_price

  def reserve_price
    self.reserved_price = product.price
  end
end
