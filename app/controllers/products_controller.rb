class ProductsController < ApplicationController
  def index
    @products = Product.all
    logger.debug "products is =============#{@products.inspect}"
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(post_params)
    if @product.save
      render 'index'
    else
      render 'new'
    end
  end

  private
  def post_params
    params.require(:product).permit(:title, :description, :tags, :image_url, :price)
  end
end
