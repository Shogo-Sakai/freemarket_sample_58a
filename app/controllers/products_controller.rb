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

  private

  def product_params
    params.permit(:image)
  end
end
