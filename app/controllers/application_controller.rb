class ApplicationController < ActionController::Base
  # An explicit call to protect_from_forgery to implement CSRF is no longer
  # needed in Rails 5.2+, since it is now enabled by default through
  # configuration.
  #
  # To inspect that configuration:
  #
  #   $ bin/rails console
  #   irb(main):001:0> RailsSocial::Application::config.action_controller.default_protect_from_forgery
  #   => true
  protect_from_forgery with: :null_session

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end
  helper_method :current_user

  def authenticate_user!
    redirect_to login_path unless current_user
  end

  def authenticate_token!
    authenticate_or_request_with_http_token do |token, options|
      @api_user = User.find_by(api_token: token)
    end
  end
end
