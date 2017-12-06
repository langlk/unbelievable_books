class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    if current_user.account.has_purchased?(@product)
      @review = @product.reviews.new
      render :new
    else
      flash[:alert] = "No time travel allowed! You can only review books you have purchased."
      redirect_to product_path(@product)
    end
  end

  def create
    @product = Product.find(params[:product_id])
    if current_user.account.has_purchased?(@product)
      @review = @product.reviews.new(review_params)
      @review.account = current_user.account
      if @review.save
        flash[:notice] = "You have successfully reviewed this book!"
        redirect_to product_path(@product)
      else
        flash[:alert] = @review.errors.full_messages
        render :new
      end
    else
      flash[:alert] = "No time travel allowed! You can only review books you have purchased."
      redirect_to product_path(@product)
    end
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if current_user.account == @review.account
      render :edit
    else
      flash[:alert] = "This isn't your review! You are meddling with forces beyond your control."
      redirect_to product_path(@product)
    end
  end

  def update
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if current_user.account == @review.account
      if @review.update(review_params)
        flash[:notice] = "You have successfully updated this review. It's much better now."
        redirect_to product_path(@product)
      else
        flash[:alert] = @review.errors.full_messages
        render :edit
      end
    else
      flash[:alert] = "This isn't your review! You are meddling with forces beyond your control."
      redirect_to product_path(@product)
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    if (current_user.account == @review.account) || current_user.admin?
      @review.destroy
      flash[:notice] = "This review was incinerated by your blaster ray."
    else
      flash[:alert] = "This isn't your review! You are meddling with forces beyond your control."
    end
    redirect_to product_path(@product)
  end

private
  def review_params
    params.require(:review).permit(:content)
  end
end
