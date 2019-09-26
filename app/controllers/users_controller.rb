class UsersController < ApplicationController
  before_action :redirect_to_login_form_unless_signed_in

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
    @user = current_user
  end

  def delete
  end

  def credit_register
  end

  def logout
  end
end
