# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end
  
  private
  # アクティブであるかを判断するメソッド
  def customer_state
    #入力されたemailからアカウントを1件取得
    customer = Customer.find_by(email: params[:customer][:email])
    
    #アカウントを取得できなかった場合、このメソッドを終了する
    return if customer.nil?
    
    #取得したアカウントのパスワードと入力されたパスワードが一致していない場合、このメソッドを終了する
    return unless customer.valid_password?(params[:customer][:password])
    
    #アクティブでない会員に対する分岐処理
    # アカウントが有効 → 処理を継続するため、このメソッドを終了
    if customer.is_active
      return
    # アカウントが無効 → サインアップ画面にリダイレクト
    else
      flash[:alert] = "このアカウントは退会済みです。新規登録を行ってください。"
      redirect_to new_customer_registration_path
    end
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  end



end
