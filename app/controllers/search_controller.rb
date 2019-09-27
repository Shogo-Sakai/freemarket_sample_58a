class SearchController < ApplicationController

  def index
    @form = SearchForm.new(search_params)

    if search_params[:keyword].length == 0
      @search_word = "新着商品"
      @products = Product.order('created_at DESC').limit(30)
    else
      @search_word = search_params[:keyword]
      @products = Product.where(["title LIKE(?) OR text LIKE(?) OR fresh_status LIKE(?) OR deliver_way LIKE(?) OR from_area LIKE(?)","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%","%#{search_params[:keyword]}%"])
    end
    @products = @products.page(params[:page]).per(28)

  end

  private

  def search_params
    params.require(:search_form).permit(:keyword)
  end
end
