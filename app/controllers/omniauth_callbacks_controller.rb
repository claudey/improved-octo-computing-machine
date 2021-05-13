class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # render json: request.env['omniauth.auth']
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      if is_navigational_format?
        set_flash_message( :notice, :success, kind: 'Facebook' )
      end
    else
      flash[:alert] = 'There was a problem signing you in through Facebook. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def github
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      if is_navigational_format?
        set_flash_message( :notice, :success, kind: 'Github' )
      end
    else
      flash[:alert] = 'There was a problem signing you in through Github. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
    @user = User.find_for_oauth(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      if is_navigational_format?
        set_flash_message( :notice, :success, kind: 'Google' )
      end
    else
      flash[:alert] = 'There was a problem signing you in through Google. Please register or try signing in later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:alert] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end