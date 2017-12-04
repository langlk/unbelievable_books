class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :account
  validates_presence_of :product, :account, :content
end
