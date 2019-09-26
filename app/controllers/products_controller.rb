class ProductsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :redirect_to_login_form_unless_signed_in, except: :show
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user

    if @product.category_index_id != nil && params[:product_image].present? && params[:product_image][:image].length <= 10 && @product.save
      params[:product_image][:image].each do |image|
        @product.product_images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
      return false
    else
      @product.valid?
      if params[:product_image].present? == false
        @product.errors.messages[:image] = ["image is blank"]
      elsif params[:product_image][:image].length > 10
        @product.errors.messages[:image] = ["image is too many"]
      end 
      @product.errors.messages[:category_index_id] = ["is reserved"] if @product.category_index_id == nil
      render json: {errors: @product.errors.messages},status: 422
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to root_path
  end

  def bigcategory
    # debugger
    respond_to do |format|
      format.json{@bigcategory_options = Bigcategory.where(category_index: params[:category_id])}
    end
  end

  def smallcategory
    respond_to do |format|
      format.json{@smallcategory_options = Smallcategory.where(bigcategory: params[:bigcategory_id])}
      # debugger
    end
  end

  def size
    # debugger
    respond_to do |format|
      # debugger
      format.json{@size_options = Smallcategory.find_by(id: params[:smallcategory_id]).smallcategories_has_sizes}
      # debugger
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.user_id == current_user.id
      if @product.update(product_params)
        redirect_to root_path
      else
        render 'products/edit'
      end
    else 
      render 'products/edit'
    end
  end

  private

  def product_params
    params.require(:product).permit(:title, :text, :category_index_id ,:fresh_status, :deliver_way, :deliver_person, :from_area, :deliver_leadtime, :price, :deliver_day,:bigcategory_id, :smallcategory_id, :size_id)
  end

  def image_params
  end

end
