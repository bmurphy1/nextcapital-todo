class UsersController < ApplicationController
  skip_before_filter :authenticate_user_from_token!, :only => :create

  def create
    token = Devise.friendly_token
    user = User.new(:email => params[:email], :password => params[:password], :api_token => token)
    if user.valid?
      user.save!
      render :json => user.render_json
    else
      render_error user.errors.messages
    end
  end

end
