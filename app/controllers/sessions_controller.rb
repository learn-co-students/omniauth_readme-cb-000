class SessionsController < ApplicationController

  def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
      # u.provider = auth['provider'] ? It would be nice to keep track of how the user was authenticated.
    end

    session[:user_id] = @user.id
    # or something like @provider = auth['provider'] to customize the welcome/home view?
    render 'welcome/home'

  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end