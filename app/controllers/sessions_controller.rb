class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
  end

  def destroy
    sign_out current_user
    redirect_to new_sessions_path
  end
end
