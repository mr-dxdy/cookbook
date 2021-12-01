class GuestSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: :new

  def new
    authorize User, :create_guest?

    if user = User.find_or_create_by(email: Settings.guest_email)
      sign_in user

      redirect_to redirect_after_sign_in, notice: "Добро пожаловать!"
    else
      redirect_to new_session_path, alert: "Не удалось войти как гость"
    end
  end
end
