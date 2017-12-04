require 'rails_helper'

describe Order do
  it { should belong_to :account }
  it { should validate_presence_of :account }
  it { should validate_presence_of :price_total }
  it { should validate_presence_of :status }

  describe '#add_total' do
    it "returns the total cost of items in an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      expect(order.add_total).to eq (75)
    end
  end


end
