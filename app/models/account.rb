class Account < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
  validates_presence_of :user
end
