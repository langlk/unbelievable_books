class Order < ActiveRecord::Base
  belongs_to :account
  has_many :order_items
  validates_presence_of :account, :price_total, :status
  before_save :update_total

  def add_total
    self.order_items.collect { |item| item.reserved_price * item.quantity }.sum
  end

  def update_total
    self.price_total = self.add_total
  end
end
