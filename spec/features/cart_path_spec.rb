require 'rails_helper'

describe "the cart management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "allows user to raincheck books" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Raincheck"
    visit cart_path
    expect(page).to have_content("You and Your Bantha")
  end

  it "allows user to add items to cart" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Add to cart"
    visit cart_path
    expect(page).to have_content("You and Your Bantha")
  end

  it "allows user to move items from raincheck to cart" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Raincheck"
    visit cart_path
    click_on "Add to cart"
    expect(page).to have_content("Your Cart 1 You and Your Bantha")
  end

  it "displays error message when book cannot be updated from raincheck to cart" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Raincheck"
    visit cart_path
    book.update(quantity: 0)
    click_on "Add to cart"
    expect(page).to have_content ("Something went wrong")
  end

  it "allows user to remove books from cart or raincheck" do
    book = FactoryBot.create(:product)
    visit product_path(book)
    click_on "Add to cart"
    visit cart_path
    click_on "Remove"
    expect(page).to have_content ("Book vented from airlock.")
  end



end
