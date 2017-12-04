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
end
