class Account < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :orders
  validates_presence_of :user

  def cart
    cart_order = self.orders.where(status: "Cart").take
    if cart_order
      return cart_order
    else
      return self.orders.create(status: "Cart", price_total: 0)
    end
  end

  def raincheck
    raincheck_order = self.orders.where(raincheck: true).take
    if raincheck_order
      return raincheck_order
    else
      return self.orders.create(status: "Rainchecked", raincheck: true, price_total: 0)
    end
  end

  def has_purchased?(product)
    Order.where(account: self, status: "Placed").each do |order|
      order.order_items.each do |item|
        if item.product == product
          return true
        end
      end
    end
    return false
  end
end
