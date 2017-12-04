require 'rails_helper'

describe Account do
  it { should belong_to :user }
  it { should have_many :reviews }
  it { should have_many :orders }
  it { should validate_presence_of :user }

  describe "#cart" do
    it "returns the order with status 'cart' associated with the account" do
      user = FactoryBot.create(:user)
      expect(user.account.cart.status).to eq("Cart")
    end
  end

  describe '#rainchecked' do
    it "returns the order marked raincheck associated with the account" do
      user = FactoryBot.create(:user)
      expect(user.account.raincheck.raincheck).to eq(true)
    end
  end
end
