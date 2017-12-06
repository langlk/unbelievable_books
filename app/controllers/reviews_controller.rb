class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.account = current_user.account
    if @review.save
      flash[:notice] = "You have successfully reviewed this book!"
      redirect_to product_path(@product)
    else
      flash[:alert] = @review.errors.full_messages
      render :new
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "You have successfully updated this review. It's much better now."
      redirect_to product_path(@product)
    else
      flash[:alert] = @review.errors.full_messages
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy
    flash[:notice] = "This review was incinerated by your blaster ray."
    redirect_to product_path(@product)
  end 

private
  def review_params
    params.require(:review).permit(:content)
  end
end
