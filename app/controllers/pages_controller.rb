class PagesController < ApplicationController
  skip_before_action :verify_autheticity_token, raise: false
  before_action :authenticate_devise_api_token!, only: [:profile]
  def home
  end

  def profile
    devise_api_token = current_devise_api_token
    if devise_api_token.present?
      render json: { message: "You are Logged in as #{devise_api_token.resource_owner}" }, status: :ok
    else
      render json: { message: "Invalid token" }, status: :unauthorized
    end
  end
end
