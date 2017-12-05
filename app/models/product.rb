class Product < ActiveRecord::Base
  has_many :reviews
  validates_presence_of :name, :description, :quantity, :price, :author

  scope :alphabetical, -> { order(:name) }
end
