class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.category_index_id != 0 && params[:product_image].present? && params[:product_image][:image].length <= 10 && @product.save
      params[:product_image][:image].each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
      return false
    else
      @product.valid?
      if params[:product_image].present? == false
        @product.errors.messages[:image] = ["image is blank"]
      elsif params[:product_image][:image].length > 10
        @product.errors.messages[:image] = ["image is too many"]
      end 
      @product.errors.messages[:category_index_id] = ["is reserved"] if @product.category_index_id == 0
      render json: {errors: @product.errors.messages},status: 422
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def purchase_confirmation
    render layout: 'form_layout'
  end

  private

  def product_params
    params.require(:product).permit(:title, :text, :category_index_id ,:fresh_status, :deliver_way, :deliver_person, :from_area, :deliver_leadtime, :price, :deliver_day)
  end

  def image_params
  end

end
