class WelcomeController < ApplicationController
  #a change
  def home
    if session[:user_id]
      @user = User.find(session[:user_id])
    end
  end
end
