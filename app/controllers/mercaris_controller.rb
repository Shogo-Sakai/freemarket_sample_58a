class MercarisController < ApplicationController
  def index
    @products        = Product.order('created_at DESC').limit(10)
    @categories      = CategoryIndex.all
    @bigcategories   = Bigcategory.all
    @smallcategories = Smallcategory.all
  end
end
