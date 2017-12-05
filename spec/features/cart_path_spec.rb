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
end
