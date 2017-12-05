class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :quantity, :price, :author

  scope :alphabetical, -> { order(:name) }
  scope :featured, -> { where("featured = true") }

  def low_stock?
    self.quantity <= 10
  end

  def get_price
    if self.discount && self.discount_end
      if self.discount_end >= Date.today
        return self.price - (self.price * (self.discount / 100.0)).to_i
      end
    end
    return self.price
  end
end
