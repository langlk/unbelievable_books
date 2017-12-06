require 'rails_helper'

describe "the checkout path" do
  before do
    @user = FactoryBot.create(:user, admin: true)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "displays a users cart at the checkout page" do
    product = FactoryBot.create(:product)
    visit product_path(product)
    click_on "Add to cart"
    visit cart_path
    click_link "Checkout"
    expect(page).to have_content("You and Your Bantha")
    expect(page).to have_no_content("Rainchecked")
  end




end
