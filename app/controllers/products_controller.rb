class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def new
    render layout: 'form_layout'
    @category_index = CategoryIndex.all
  end

  def create
    @product = Product.new(product_params)
    @product.save

    @image = Image.new(content: params[:file])
    if @image.save
      render json: { message:"success", fileID:@image.id }, status: 200
    else
      render json: { error: @image.errors.full_messages.join(',')}, status: 400
    end
    redirect_to users_path
  end

  private

  def product_params
    params.require(@product).permit(:bigcategory, :category_index, :fresh_status, :name, :sell_status,:size, :smallcategory, :text, :user)
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
