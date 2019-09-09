class ProductsController < ApplicationController
  def new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to root_path
  end

  private

  def product_params
    params.permit(:image)
  end
end
