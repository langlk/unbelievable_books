require 'rails_helper'

describe "the order history management path" do
  before do
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "displays all past orders for current user" do
    order = FactoryBot.create(:order, account: @user.account, status: "Placed", final_price: 10)
    item = FactoryBot.create(:order_item, order: order)
    visit orders_path
    expect(page).to have_content("You and Your Bantha")
  end

end
