class CommentsController < ApplicationController
  
  def new
    @comment = Comment.new
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
  end
  
  def create
    @comments = Comment.create(text: comment_params[:text], rate: comment_params[:rate], product_id: params[:product_id], review_id: params[:review_id], user_id: current_user.id)
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
  end
  
  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
  end
  
  def destroy
    comment = Comment.find(params[:id])
    if comment.user_id == current_user.id
      comment.destroy
    end
  end
  
  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
    @comment = Comment.find(params[:id])
  end
  
  def update
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.update(comment_params)
    end
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:review_id])
  end
  
  private
  def comment_params
    params.require(:comment).permit(:text, :rate).merge(product_id: params[:product_id], review_id: params[:review_id], user_id: current_user.id)
  end
  
end
