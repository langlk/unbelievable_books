FactoryBot.define do
  factory(:user) do
    email("test@test.com")
    password("Test123")
    password_confirmation("Test123")
  end

  factory(:account) do
    user
  end

  factory(:order) do
    account
    price_total(0)
    status("Cart")
    raincheck(false)
  end

  factory(:product) do
    name("You and Your Bantha")
    author("Luke Skywalker")
    description("Quasi unreliable pet ownership manual")
    price(15)
    quantity(10)
  end

  factory(:order_item) do
    order
    product 
    quantity(5)
  end



end
