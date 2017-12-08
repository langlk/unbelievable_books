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

  it "allows a user to edit their own reviews" do
    order = FactoryBot.create(:order, account: @user.account, status: "Placed")
    item = FactoryBot.create(:order_item, order: order)
    review = FactoryBot.create(:review, product: item.product, account: @user.account)
    visit product_reviews_path(item.product)
    click_on "Edit"
    fill_in "Content", with: "This is a fantastic book!"
    click_button "Save"
    expect(page).to have_content("This is a fantastic book!")
  end

  it "does not allow a user to edit someone else's review" do
    user2 = FactoryBot.create(:user, email: 'test2@test.com')
    order = FactoryBot.create(:order, account: user2.account, status: "Placed")
    item = FactoryBot.create(:order_item, order: order)
    review = FactoryBot.create(:review, product: item.product, account: user2.account)
    visit edit_product_review_path(item.product, review)
    expect(page).to have_content("This isn't your review! You are meddling with forces beyond your control.")
    expect(page).to have_no_content("Edit Review")
  end

  it "allows user to delete their reviews" do
    order = FactoryBot.create(:order, account: @user.account, status: "Placed")
    item = FactoryBot.create(:order_item, order: order)
    review = FactoryBot.create(:review, product: item.product, account: @user.account)
    visit product_reviews_path(item.product)
    click_on "Delete"
    expect(page).to have_no_content("This book made me want to leave the Earth permanently!")
  end
end
