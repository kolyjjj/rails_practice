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

  #def upload
  #  uploaded_io = params[:product][:image_url]
  #  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
  #    file.write(uploaded_io.read)
  #  end
  #end

  def update
    @product = Product.find(params[:id])
    logger.debug "the product to be updated is: -----#{@product.inspect}"
    logger.debug "the new product is: -----#{param[:product]  .inspect}"

    #product = params[:product]
    if @product.update(post_params)
    #if @product.update({:title => product[:title], :description => product[:description],
    #                        :price => product[:price], :tags => product[:tags],
    #                        :image_url => product[:image_url].original_filename})
      redirect_to products_path
    else
      render :edit
    end
  end

  def create
    logger.debug "the product to be created is: -----#{params[:product].inspect}"
    product = params[:product]
    pic = product[:image_url].original_filename if !product[:image_url].nil?

    @product = Product.new({:title => product[:title], :description => product[:description],
                            :price => product[:price], :tags => product[:tags],
                            :image_url => pic})
    if @product.save
      savePicture(product)
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

  def savePicture(product)
    uploaded_io = product[:image_url]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
  end

  def product_params
    logger.debug "parmas.require is: #{params.require(:product)}"
    params.require(:product).permit(:title, :description, :tags, :price, :image_url)
  end
end
