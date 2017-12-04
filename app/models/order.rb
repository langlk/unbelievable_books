class Order < ActiveRecord::Base
  belongs_to :account
  validates_presence_of :account, :price_total, :status
end
