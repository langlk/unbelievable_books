class Order < ActiveRecord::Base
  belongs_to :account
  has_many :order_items
  validates_presence_of :account, :price_total, :status
end
