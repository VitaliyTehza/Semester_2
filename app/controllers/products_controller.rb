class ProductsController < ApplicationController
    before_action :authenticate_user!, except: [:show]
    before_action :set_product, only:[:show]



  def index
    @products = Product.all.order(created_at: :DESC)
  end

  def new
    @product = Product.new
  end


  def create
    pp params[:product][:category_id]=params[:product][:category]
    params[:product][:user_id]=current_user.id
    @product = Product.create(product_params)
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
    params.require(:product).permit(:user_id,:category_id, :name, :description, :price, :count, {photos: []})
  end

  def set_product
    @product=Product.find(params[:id])
  end
end
