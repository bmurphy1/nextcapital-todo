class ApplicationController < ActionController::Base
  before_filter :authenticate_user_from_token!, :except => :cors_preflight_check

  after_filter :set_cors_headers

  rescue_from(Exception) do |e|
    set_cors_headers
    render :json => {:error => e.message}, status => 500
  end

  def cors_preflight_check
    render :text => '', :content_type => 'text/plain'
  end

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin']  = '*'
    headers['Access-Control-Allow-Headers'] = 'api_token, Content-Type'
    headers['Access-Control-Allow-Methods'] = 'GET,PUT,POST,DELETE'
  end

  # TokenAuthenticatable is no longer supported in Devise -
  # https://gist.github.com/josevalim/fb706b1e933ef01e4fb6
  def authenticate_user_from_token!
    user_id = params[:user_id].presence
    user = user_id && User.find(user_id)

    if user && Devise.secure_compare(user.api_token, params[:api_token])
      sign_in user, store: false and return
    end

    login_error "Please sign in first."
  end

  def login_error message
    set_cors_headers
    render :json => {:message => message}, :status => 400
  end
end
