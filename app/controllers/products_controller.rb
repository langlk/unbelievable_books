class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @featured = Product.featured
    @discounted = Product.discounted
    if current_user
      @preferred = current_user.account.preferred
    else
      @preferred = false
    end

    @sort_method = params[:sort_method] ? params[:sort_method] : "alphabetical"
    if (@sort_method == 'price_ascending')
      @products = Product.price_low_to_high(@preferred).paginate(:page => params[:page], :per_page => 10)
    elsif(@sort_method == 'price_descending')
      @products = Product.price_high_to_low(@preferred).paginate(:page => params[:page], :per_page => 10)
    else
      @products = Product.alphabetical.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      respond_to do |format|
        format.html {
          flash[:notice] = "Product created!"
          redirect_to product_path(@product)
        }
        format.js
      end
    else
      flash[:alert] = @product.errors.full_messages
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @order_item = OrderItem.new
    if @product.update(product_params)
      respond_to do |format|
        format.html {
          flash[:notice] = "Product updated successfully."
          redirect_to product_path(@product)
        }
        format.js
      end
    else
      flash[:alert] = @product.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html {
        flash[:notice] = "Product has sucked into a black hole."
        redirect_to products_path
      }
      format.js
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price, :quantity, :author, :featured, :discount, :discount_end)
  end
end
