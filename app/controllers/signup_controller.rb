class SignupController < ApplicationController
  layout 'form_layout'
  require 'payjp'
  Payjp.api_key = ENV["PAYJP_PRYVATE_KEY"]
  #2ページ目のみ編集したい場合は下の行をコメントアウト
  before_action :first_validation, only: :sms_authentication 
  #4ページ目のみ編集する場合は下の行をコメントアウト
  before_action :second_validation, only: :creditcard

  def index
  end

  def registration
    @user = User.new
    @profile = Profile.new
  end

  def sms_authentication
    @profile = Profile.new
  end

  def adress
    @profile = Profile.new
  end

  def creditcard
   
  end

  def done
  end

  def signin
  end

  def create
    @user = User.new(nickname: session[:nickname],email: session[:email],password: session[:password],password_confirmation: session[:password_confirmation])
    render "signup/registration" unless @user.save
    @profile = Profile.create(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      post_family_name: session[:family_name],
      post_personal_name: session[:personal_name],
      post_family_name_kana: session[:family_name_kana],
      post_personal_name_kana: session[:personal_name_kana],
      prefecture: session[:prefecture],
      city: session[:city],
      adress: session[:adress],
      postal_code: session[:postal_code],
      tel: session[:tel],
      building: session[:building]
    )
    customer = Payjp::Customer.create(
      card: params[:payjp_token]
    )
    @creditcard = Creditcard.new(user: @user,customer_id: customer.id,card_id: customer.default_card)
    if @creditcard.save
      reset_session
      redirect_to done_signup_index_path
    else
      reset_session
      redirect_to signup_index_path
    end
  end
  
  
  private
  
  

  def user_params
    params.require(:user).permit(:nickname,:email,:password,:password_confirmation)
  end

  def profile_params
    params.require(:profile).permit(:birthyear,:birthmonth,:birthday,:family_name,:personal_name,:family_name_kana,:personal_name_kana,:postal_code,:prefecture,:city,:adress,:building,:tel)
  end
  
  def first_validation
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:birthyear] = profile_params[:birthyear]
    session[:birthmonth] = profile_params[:birthmonth]
    session[:birthday] = profile_params[:birthday]
    session[:family_name] = profile_params[:family_name]
    session[:personal_name] = profile_params[:personal_name]
    session[:family_name_kana] = profile_params[:family_name_kana]
    session[:personal_name_kana] = profile_params[:personal_name_kana]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      post_family_name: "仮登録",
      post_personal_name: "仮免",
      post_family_name_kana: "カリ",
      post_personal_name_kana: "トウ",
      prefecture: '沖縄',
      city: '那覇市',
      adress: 'うちなー',
      postal_code: '888-8888'
    )
    @user.valid?
    @profile.valid?
    render 'signup/registration' unless @user.valid? && @profile.valid?
  end

  def second_validation
    session[:prefecture] = profile_params[:prefecture]
    session[:city] = profile_params[:city]
    session[:adress] = profile_params[:adress]
    session[:postal_code] = profile_params[:postal_code]
    session[:tel] = profile_params[:tel]
    session[:building] = profile_params[:building]
    session[:post_family_name] = profile_params[:post_family_name]
    session[:post_personal_name] = profile_params[:post_personal_name]
    session[:post_family_name_kana] = profile_params[:post_family_name_kana]
    session[:post_personal_name_kana] = profile_params[:post_personal_name_kana]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @profile = Profile.new(
      user: @user,
      birthyear: session[:birthyear],
      birthmonth: session[:birthmonth],
      birthday: session[:birthday],
      family_name: session[:family_name],
      personal_name: session[:personal_name],
      family_name_kana: session[:family_name_kana],
      personal_name_kana: session[:personal_name_kana],
      post_family_name: session[:family_name],
      post_personal_name: session[:personal_name],
      post_family_name_kana: session[:family_name_kana],
      post_personal_name_kana: session[:personal_name_kana],
      prefecture: session[:prefecture],
      city: session[:city],
      adress: session[:adress],
      postal_code: session[:postal_code]
    )
    
    render 'signup/adress' unless @profile.valid? 

  end


end