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

  describe '#update_total' do
    it "sets the total cost of an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      order.update_total
      expect(order.price_total).to eq (75)
    end
  end

  describe '#book_count' do
    it "returns the quantity of books in an order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      expect(order.book_count).to eq (5)
    end
  end


end
