class ProductsController < ApplicationController
  def new
    render layout: 'form_layout'
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end

  def show
  end

  def purchase_confirmation
    render layout: 'form_layout'
  end

  private

  def product_params
    params.permit(:image)
  end
end
