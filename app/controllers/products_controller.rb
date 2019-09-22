class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
        params[:product_image][:image].each do |image|
          @product.product_images.create(image: image, product_id: @product.id)
        end
        format.html{redirect_to root_path}
      else
        @product.product_images.build
        format.html{render action:'new'}
      end
    end
  end

  def show
  end

  private

  def product_params
    params.require(:product).permit(:name, :text, :category_index_id ,:fresh_status, :deliver_way, :deliver_person, :from_area, :deliver_leadtime, :price,product_image_attributes:[:image]).merge(user_id: current_user.id)
  end

end

