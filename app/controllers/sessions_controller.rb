class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    redirect_to redirect_after_sign_in if current_user
  end

  def destroy
    sign_out current_user
    redirect_to new_sessions_path
  end
end
