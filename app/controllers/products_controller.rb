class ProductsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @products = Product.includes(:user).page(params[:page]).per(5).order("created_at DESC")
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @products = Product.create(bookname: product_params[:bookname], author: product_params[:author], image: product_params[:image], user_id: current_user.id)
  end
  
  def show
    @product = Product.find(params[:id])
    @review = @product.reviews.all.count
    @products = Product.page(params[:id]).per(10).order("created_at DESC")
    @reviews = Review.order("created_at ASC").page(params[:page]).per(5)
  end
  
  def search
    @products = params[:keyword].present? ? Product.where('bookname LIKE(?)', "%#{params[:keyword]}%") : []
  end
  
  private
  def product_params
    params.require(:product).permit(:bookname, :author, :image)
  end

end
