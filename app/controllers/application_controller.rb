class ApplicationController < ActionController::Base
  include CurrentUserControllerMethods
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  before_action :authenticate_user!

  private

  def user_not_authorized(exception)
    redirect_to root_path, alert: "Доступ запрещен"
  end
end
