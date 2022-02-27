# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # GET|POST /resource/auth/twitter
  def passthru
    super
  end

  # GET|POST /users/auth/twitter/callback
  def failure
    super
  end

  def stripe_connect
    auth_data = request.env["omniauth.auth"]
    @user = current_user

    if @user.persisted?
      @user.uid = auth_data.uid
      @user.provider = auth_data.provider
      @user.access_code = auth_data.credentials.token
      @user.publishable_key = auth_data.info.stripe_publishable_key
      @user.bank= auth_data.extra.extra_info.external_accounts.data[0].bank_name
      @user.save

      sign_in_and_redirect @user, event: :authentication
      flash[:notice] = "Stripe Account Connected" if is_navigational_format?
    else
      session["devise.stripe_connect_data"] = request.env["omniauth.auth"]
      redirect_to root_path
    end
  end

  def failure
    redirect_to root_path
  end

  # protected

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(scope)
    super(scope)
  end
end
