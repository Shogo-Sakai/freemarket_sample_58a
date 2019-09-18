class MercarisController < ApplicationController
  def index
    @products = Product.order('created_at DESC').limit(10)
  end
end
