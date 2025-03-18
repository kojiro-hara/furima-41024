class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :family_name, :first_name, :family_reading, :first_reading, :birthday])
  end

  def sign_up_params
    params.require(:user).permit(:nickname, :email, :password, :family_name, :first_name, :family_reading, :first_reading, :birthday).tap do |user_params|
      # 'birthday'がハッシュとして渡された場合、それをDate型に変換
      if user_params[:birthday].is_a?(Hash)
        user_params[:birthday] = Date.new(user_params[:birthday]["1i"].to_i, user_params[:birthday]["2i"].to_i, user_params[:birthday]["3i"].to_i)
      end
    end
  end


  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end

end
