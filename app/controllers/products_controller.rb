class ProductsController < ApplicationController
  def index
    @products = Product.all
    logger.debug "products is =============#{@products.inspect}"
  end

  def new
    @product = Product.new if @product.nil?
    logger.debug "product in new is: #{@product.inspect}"
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(post_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def create
    @product = Product.new(post_params)
    if @product.save
      redirect_to action: 'index'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  private
  def post_params
    params.require(:product).permit(:title, :description, :tags, :image_url, :price)
  end
end
