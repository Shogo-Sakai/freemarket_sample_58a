class SearchController < ApplicationController
  def index
    @products = Product.all
  end
end
