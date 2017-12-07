require "rails_helper"

describe "the review management path" do
  before do
    @product = FactoryBot.create(:product)
    @user = FactoryBot.create(:user)
    visit '/users/sign_in'
    fill_in "Email", with: @user.email
    fill_in "Password", with: @user.password
    click_button "Log in"
  end

  it "does not allow a user to review a product they have not purchased" do
    visit new_product_review_path(@product)
    expect(page).to have_no_content("Add a Review")
    expect(page).to have_content("No time travel allowed! You can only review books you have purchased.")
  end

  it "does allow a user to review a product they have purchased" do
    order = FactoryBot.create(:order, account: @user.account, status: "Placed")
    item = FactoryBot.create(:order_item, order: order)
    visit new_product_review_path(item.product)
    fill_in "Content", with: "This is a fantastic book!"
    click_button "Save"
    expect(page).to have_content("This is a fantastic book!")
  end

  it "displays error messages when review cannot be saved" do
    order = FactoryBot.create(:order, account: @user.account, status: "Placed")
    item = FactoryBot.create(:order_item, order: order)
    visit new_product_review_path(item.product)
    click_button "Save"
    expect(page).to have_content("Something went wrong")
  end
end
