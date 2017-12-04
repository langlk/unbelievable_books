class Account < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  has_many :orders
  validates_presence_of :user

  def current_order
    current = self.orders.where(status: "Cart").take
    if current
      return current
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
end
