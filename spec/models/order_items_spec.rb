require 'rails_helper'

describe OrderItem do
  it { should belong_to :order }
  it { should belong_to :product }
  it { should validate_presence_of :order }
  it { should validate_presence_of :product }
  it { should validate_presence_of :quantity }

  describe '#check_quantity' do
    it "should not allow an order_item to be saved if its quantity is 0 or less" do
      item = FactoryBot.build(:order_item, quantity: 0)
      expect(item.save).to eq(false)
    end

    it "should not allow an order_item to be saved if its quantity is larger than the product quantity" do
      item = FactoryBot.build(:order_item, quantity: 1000000)
      expect(item.save).to eq(false)
    end
  end

  describe '#reserve_price' do
    it "sets price of book to current list price" do
      item = FactoryBot.create(:order_item)
      product = item.product
      expect(item.reserved_price).to eq (product.price)
    end

    it "maintains reserved price of book in cart if general price changes" do
      item = FactoryBot.create(:order_item)
      product = item.product
      product.update(price: 20)
      expect(item.reserved_price).to eq (15)
    end
  end

  describe '#update_order_total' do
    it "updates order total cost after removing a book from order" do
      order = FactoryBot.create(:order)
      item = FactoryBot.create(:order_item, order: order)
      product = item.product
      order = item.order
      item.destroy
      order = Order.find(order.id)
      expect(order.price_total).to eq (0)
    end

    it "updates order total cost after adding a book to order" do
      item = FactoryBot.create(:order_item)
      product = item.product
      order = item.order
      item2 = FactoryBot.create(:order_item, order: order)
      order = Order.find(order.id)
      expect(order.price_total).to eq (150)
    end
  end


end
