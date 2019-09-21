class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    render layout: 'form_layout'
    @category_index = CategoryIndex.all
  end

  def create
    # @product = Product.new(product_params)
    # @product.save
    @image = Image.new(image: params[:file])
    # debugger
    if @image.save!
      respond_to do |format|
        format.json{render json: @image}
        # debugger
      end
    end

    # redirect_to users_path
    # exit
  end

  def show
  end

  private

  def product_params
    params.require(@product).permit(:category_index, :fresh_status, :name, :text, :image)
  end

  def image_params
    params.require(@image).permit(:image)
  end

  def price_params
    params.require(@price).permit(:benefit, :fee, :sell)
  end

  def delivery_params
    params.require(@delivery).permit(:deliver_way, :fee_person, :from_area, :sending_day)
  end

  def brand_params
    params.require(@brand).permit(:name)
  end

end

