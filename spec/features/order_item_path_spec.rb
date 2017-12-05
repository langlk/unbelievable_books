require 'rails_helper'

describe "the order_items management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "displays errors if item cannot be added to cart" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    book.update(quantity: 0)
    click_on "Add to cart"
    expect(page).to have_content("Something went wrong")
  end


end
