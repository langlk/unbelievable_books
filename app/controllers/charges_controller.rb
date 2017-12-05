class ChargesController < ApplicationController
  def new
    @cart = current_cart
  end

  def create
    @cart = current_cart
    # Check if everything in cart is valid
    if @cart.confirm_items
      # Amount in cents
      @amount = @cart.price_total * 100

      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )

      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
      # Update products ordered to lower quantity appropriately
      @cart.remove_inventory
      # Change cart order from cart to placed.
      @cart.update(status: "Placed")
    else
      flash[:alert] = @cart.errors.full_messages
      flash[:alert].push("You have not been charged. Please update your cart.")
      redirect_to new_cart_charge_path
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_cart_charge_path
  end
end
