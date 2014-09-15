class SessionsController < Devise::SessionsController
  skip_before_action :authenticate_user_from_token!, :only => [:create]

  def destroy
    current_user.api_token = nil
    current_user.save!
    super
  end

  def create
    resource = User.find_for_database_authentication(:email => params[:email])

    return login_error "Couldn't find a user with that email." unless resource

    if resource.valid_password?(params[:password])
      resource.api_token = Devise.friendly_token
      resource.save!

      sign_in("user", resource)

      render :json => _to_json(resource, {
        :include => { :todos => { :only => :id } },
        :except => [:created_at, :updated_at]
      }) and return
    end

    login_error "Password is not valid."
  end

  def _to_json resource, opts
    json = resource.as_json(opts)
    json['todos'] = json['todos'].map { |todo| todo['id'] }
    json.to_json
  end

end
