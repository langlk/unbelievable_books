require 'rails_helper'

describe Account do
  it { should belong_to :user }
  it { should have_many :reviews }
  it { should have_many :orders }
  it { should validate_presence_of :user }

  describe "#cart" do
    it "returns a new cart order for account if none exists" do
      user = FactoryBot.create(:user)
      expect(user.account.cart.status).to eq("Cart")
    end

    it "returns the cart order associated with account if it exists" do
      user = FactoryBot.create(:user)
      user.account.cart
      expect(Order.first).to eq(user.account.cart)
    end
  end

  describe '#rainchecked' do
    it "returns a new rainchecked order for account if one does not exist" do
      user = FactoryBot.create(:user)
      expect(user.account.raincheck.raincheck).to eq(true)
    end

    it "returns the rainchecked order for account if it exists" do
      user = FactoryBot.create(:user)
      user.account.raincheck
      expect(Order.first).to eq(user.account.raincheck)
    end
  end

  describe '#has_purchased?' do
    it "returns false if account has not placed an order that includes the book" do
      account = FactoryBot.create(:account)
      product = FactoryBot.create(:product)
      expect(account.has_purchased?(product)).to eq(false)
    end

    it "returns true if account has placed an order that includes the book" do
      order = FactoryBot.create(:order, status: "Placed")
      item = FactoryBot.create(:order_item, order: order)
      expect(order.account.has_purchased?(item.product)).to eq(true)
    end
  end
end
