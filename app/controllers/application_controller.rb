class ApplicationController < ActionController::Base
  protect_from_forgery
  TOKEN = 'secret'
private 
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    case request.format
    when Mime::JSON, Mime::XML, Mime::ATOM
      authenticate_or_request_with_http_token do |token, options|
        token == TOKEN
      end
    else  
      redirect_to signin_url, alert: "Not authorized" if current_user.nil?
    end
  end
end
