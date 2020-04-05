class ReviewsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end
  
  def create
    @reviews = Review.create(review: review_params[:review], product_id: params[:product_id], user_id: current_user.id)
    @product = Product.find(params[:product_id])
  end
  
  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    @comments = @review.comments.includes(:user)
  end
  
  def destroy
    review = Review.find(params[:id])
    if review.user_id == current_user.id
      review.destroy
    end
  end
  
  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
  end
  
  def update
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    if @review.user_id == current_user.id
      @review.update(review_params)
    end
  end
  
  private
  def review_params
    params.require(:review).permit(:review).merge(product_id: params[:product_id], user_id: current_user.id)
  end
end
