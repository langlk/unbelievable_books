class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  validates_presence_of :order, :product, :quantity
  validate :check_quantity
  before_save :reserve_price
  after_save :update_order_total
  after_destroy :update_order_total

  def reserve_price
    self.reserved_price = product.get_price(self.order.account.preferred)
  end

  def update_order_total
    self.order.save
  end

  def check_quantity
    if self.quantity && self.product
      if self.quantity <= 0
        errors.add(:quantity, "must be greater than zero.")
        return false
      elsif self.quantity > self.product.quantity
        errors.add(:quantity, "cannot be greater than number of available books.")
        return false
      else
        return true
      end
    else
      return false
    end
  end
end
