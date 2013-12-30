class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new

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
