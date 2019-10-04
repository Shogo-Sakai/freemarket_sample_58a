class SearchController < ApplicationController
  before_action :set_categories

  def index
    @form = SearchForm.new(search_params)

    if search_params[:keyword].length == 0
      @search_word = "新着商品"
      @products = Product.order('created_at DESC').limit(28)
    else
      @search_word = search_params[:keyword]
      @products = Product.where(["title LIKE(?) OR text LIKE(?) OR fresh_status LIKE(?) OR deliver_way LIKE(?) OR from_area LIKE(?)","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%"])
    end

    @products = Kaminari.paginate_array(@products).page(params[:page]).per(28)    

  end

  private

  def search_params
    params.require(:search_form).permit(:keyword)
  end

  def set_categories
    @categories      = CategoryIndex.all
    @bigcategories   = Bigcategory.all
    @smallcategories = Smallcategory.all
  end

end
