require 'rails_helper'

describe Product do
  it { should have_many :reviews }
  it { should validate_presence_of :name }
  it { should validate_presence_of :description }
  it { should validate_presence_of :price }
  it { should validate_presence_of :quantity }
  it { should validate_presence_of :author }

  describe '.alphabetical' do
    it "returns products in alphabetical order by name" do
      p1 = FactoryBot.create(:product, name: "You and Your Bantha")
      p2 = FactoryBot.create(:product, name: "Dapper and Dead")
      p3 = FactoryBot.create(:product, name: "Protocol: a Love Story")
      expect(Product.alphabetical).to eq([p2,p3,p1])
    end
  end

  describe '#low_stock?' do
    it "returns true if a book has 10 or less copies in stock" do
      product = FactoryBot.create(:product, quantity: 10)
      expect(product.low_stock?).to eq(true)
    end

    it "returns false if a book has more than 10 copies in stock" do
      product = FactoryBot.create(:product, quantity: 15)
      expect(product.low_stock?).to eq(false)
    end
  end

  describe '.featured' do
    it "returns all featured products" do
      p1 = FactoryBot.create(:product, featured: true)
      p2 = FactoryBot.create(:product)
      p3 = FactoryBot.create(:product, featured: true)
      expect(Product.featured).to eq([p1,p3])
    end
  end

  describe '#has_discount?' do
    it "returns true if book is discounted at current time" do
      p1 = FactoryBot.create(:product, discount: 10, discount_end: Date.today)
      expect(p1.has_discount?).to eq(true)
    end

    it "returns false if book is not discounted at current time" do
      p1 = FactoryBot.create(:product)
      expect(p1.has_discount?).to eq(nil)
    end
  end

  describe '#get_price' do
    it "returns discounted price if discount is active" do
      p1 = FactoryBot.create(:product, price: 100, discount: 10, discount_end: Date.today)
      expect(p1.get_price).to eq(90)
    end

    it "returns normal price if item is not discounted" do
      p1 = FactoryBot.create(:product, price: 100, discount: 10)
      expect(p1.get_price).to eq(100)
    end

    it "returns 10% off on non-discounted books if status is preferred" do
      p1 = FactoryBot.create(:product, price: 100)
      expect(p1.get_price(true)).to eq(90)
    end

    it "returns time discount if preferred and item discounted" do
      p1 = FactoryBot.create(:product, price: 100, discount: 20, discount_end: Date.today)
      expect(p1.get_price(true)).to eq(80)
    end
  end

  describe '.discounted' do
    it "returns all products that have an active discount" do
      p1 = FactoryBot.create(:product, price: 100)
      p2 = FactoryBot.create(:product, price: 100, discount: 20, discount_end: Date.today)
      p3 = FactoryBot.create(:product, price: 100, discount: 20, discount_end: Date.today - 5.day)
      expect(Product.discounted).to eq([p2])
    end
  end

  describe '.price_low_to_high' do
    it "returns all products in order of price from cheapest to most expensive" do
      p1 = FactoryBot.create(:product, price: 100)
      p2 = FactoryBot.create(:product, price: 100, discount: 20, discount_end: Date.today)
      p3 = FactoryBot.create(:product, price: 100, discount: 40, discount_end: Date.today - 5.day)
      expect(Product.price_low_to_high).to eq([p2, p1, p3])
    end
  end

  describe '.price_high_to_low' do
    it "returns all products in order from most expensive to cheapest" do
      p1 = FactoryBot.create(:product, price: 100)
      p2 = FactoryBot.create(:product, price: 100, discount: 20, discount_end: Date.today)
      p3 = FactoryBot.create(:product, price: 90, discount: 20, discount_end: Date.today - 5.day)
      expect(Product.price_high_to_low).to eq([p1,p3,p2])
    end
  end
end
