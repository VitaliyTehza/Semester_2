class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    before_action :set_product, only:[:show]



  def index
    #@products = Product.all.order(created_at: :DESC)
  end

  def new
    @product = Product.new
  end


  def create
    params[:product][:category_id]=params[:category_id]
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to root_path
    else render 'new'
    end 
  end

  def show
    #@products =Product.all.order(created_at: :DESC)
  end  

  def category
     pp @products = Product.where(category_id: params[:id])
  end

  
private
  def product_params
    params.require(:product).permit(:user_id, :name, :description, :price, :count, {photos: []})
  end

  def set_product
    @product=Product.find(params[:id])
  end
end
