class ApplicationController < ActionController::Base
  protect_from_forgery
  TOKEN = 'secret'
private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_user?(user)
    user == current_user
  end

  def authorize
    case request.format
    when Mime::JSON, Mime::XML, Mime::ATOM
      # user = User.find(params[:user_id])
      # head :unauthorized unless user.api_keys.exists?(access_token: params[:access_token])
      
      authenticate_or_request_with_http_token do |token, options|
        user = User.find(params[:user_id])
        if user
          user.api_keys.exists?(access_token: token)
        end
      end
    else  
      redirect_to signin_url, alert: "Not authorized" if current_user.nil?
    end
  end
end
