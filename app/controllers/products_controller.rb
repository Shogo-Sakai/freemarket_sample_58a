class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      params[:product_image][:image].each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
    else
      render "products/new"
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def purchase_confirmation
    render layout: 'form_layout'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      if @product.update(product_params)
        redirect_to root_path
      else
        render 'products/edit'
      end
    else 
      render 'products/edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :text, :category_index_id ,:fresh_status, :deliver_way, :deliver_person, :from_area, :deliver_leadtime, :price, :deliver_day)
  end

  def image_params
  end

end
