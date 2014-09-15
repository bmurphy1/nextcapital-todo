class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user_from_token!, :only => [:create]

  def destroy
    current_user.api_token = nil
    current_user.save!
    super
  end

  def create
    resource = User.find_for_database_authentication(:email => params[:email])

    return render_error({ :error => "Couldn't find a user with that email." }) unless resource

    if resource.valid_password?(params[:password])
      resource.api_token = Devise.friendly_token
      resource.save!

      sign_in("user", resource)

      render :json => resource.render_json and return
    end

    render_error({ :error => "Password is not valid." })
  end

end
