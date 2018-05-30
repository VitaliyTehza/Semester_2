class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:show]

def index
    #@products = Product.all.order(created_at: :DESC)
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @products =Product.all.order(created_at: :DESC)
  end
  
  def new
    @categories = Category.all
    @product = Product.new
  end
  
  def create
    @product = current_user.products.build(products_params)
    if @product.save
      redirect_to root_path
    end   
  end
  
  def edit
  end
  
  def update
  end
  
private
  def products_params
    params.require(:product).permit(:user_id, :name, :description, :price, :count, {photos: []})
  end
end