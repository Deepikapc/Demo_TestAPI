class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def check_auth_token
  	if !params["auth_token"].present? 
      render json: {"status" => 422,"message" => "auth token is missing"}
    elsif params["auth_token"].present? && params["auth_token"] != AUTH_TOKEN
      render json: {"status" => 422,"message" => "auth token is invalid"}
    end
  	 
  end
end
