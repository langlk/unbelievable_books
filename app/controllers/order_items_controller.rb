class OrderItemsController < ApplicationController

  def create
    if params[:order_item][:order_type] == "Cart"
      @order = current_cart
      @message = "Item added to Cart."
    else
      @order = current_raincheck
      @message = "Item rainchecked."
    end
    @order_item = @order.order_items.new(order_item_params)
    if @order_item.save
      flash[:notice] = @message
      redirect_to product_path(@order_item.product)
    else
      flash[:alert] = @order_item.errors.full_messages
      redirect_to root_path
    end
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
    flash[:notice] = "Book removed."
    redirect_to cart_path
  end

private
  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
