class ProductsController < ApplicationController
  def index
  end

  def new

  end

  def create
    @product = Product.new(post_params)
    @product.save
    render 'index'
  end

  private
  def post_params
    params.require(:product).permit(:title, :description, :tags, :image_url, :price)
  end
end
