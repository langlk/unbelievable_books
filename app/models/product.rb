class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :quantity, :price, :author

  scope :alphabetical, -> { order(:name) }
  scope :featured, -> { where("featured = true") }

  def low_stock?
    self.quantity <= 10
  end

  def has_discount?
    (self.discount && self.discount_end) && (self.discount_end >= Date.today)
  end

  def get_price
    if self.has_discount?
      return self.price - (self.price * (self.discount / 100.0)).to_i
    end
    return self.price
  end
end
