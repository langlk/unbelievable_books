class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :quantity, :price, :author

  scope :alphabetical, -> { order(:name) }
  scope :featured, -> { where("featured = true") }
  scope :discounted, -> { where("discount > 0 AND discount_end >= ?", Date.today).order("discount_end ASC")}

  def low_stock?
    self.quantity <= 10 && self.quantity > 0
  end

  def has_discount?
    (self.discount && self.discount_end) && (self.discount_end >= Date.today)
  end

  def get_price(preferred=false)
    if self.has_discount?
      return self.price - (self.price * (self.discount / 100.0)).to_i
    elsif preferred
      return self.price - (self.price * 0.1).to_i
    end
    return self.price
  end

  def self.price_low_to_high(preferred=false)
    return Product.all.sort do |a,b|
      a.get_price(preferred) <=> b.get_price(preferred)
    end
  end

  def self.price_high_to_low(preferred=false)
    return Product.all.sort do |a,b|
      b.get_price(preferred) <=> a.get_price(preferred)
    end
  end
end
