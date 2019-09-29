class MercarisController < ApplicationController
  before_action :categories
  def index
    @products        = Product.order('created_at DESC').limit(10)
  end

  private

  def categories
    @categories      = CategoryIndex.all
    @bigcategories   = Bigcategory.all
    @smallcategories = Smallcategory.all
  end
end
