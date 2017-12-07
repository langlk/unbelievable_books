class Order < ActiveRecord::Base
  belongs_to :account
  has_many :order_items
  validates_presence_of :account, :price_total, :status
  before_save :update_total
  before_destroy :remove_items

  scope :placed, -> { where("status = 'Placed'") }

  def add_total
    OrderItem.where(order: self).collect { |item| item.reserved_price * item.quantity }.sum
  end

  def update_total
    self.price_total = self.add_total
  end

  def book_count
    self.order_items.collect { |item| item.quantity }.sum
  end

  def remove_items
    OrderItem.where(order: self).each do |item|
      item.destroy
    end
  end

  def confirm_items
    OrderItem.where(order: self).each do |item|
      if !item.check_quantity
        errors.add(:order_items, "does not have sufficient stock for #{item.product.name}.")
        return false
      end
    end
    return true
  end

  def remove_inventory
    OrderItem.where(order: self).each do |item|
      item.product.update(quantity: item.product.quantity - item.quantity)
    end
  end

  def total_with_tax
    tax_rate = TaxRate.get_tax_rate
    ((self.price_total * tax_rate) + self.price_total).round(2)
  end
end
