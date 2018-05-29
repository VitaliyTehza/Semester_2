class ProductsController < ApplicationController
before_action :authenticate_user!, except: [:show]

  def show
  end
  
  def new
    @categories = Category.all
    @product = Product.new
  end
  
  def create
    @categories = Category.find(params[:category_ids])
    @product = current_user.products.build(products_params)
    if @product.save
      @product.categories « @categories
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