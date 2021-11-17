module CurrentUserControllerMethods
  extend ActiveSupport::Concern

  included do
    def current_user
      return @current_user if defined? @current_user
      @current_user = User.find_by_id(session[:user_id])
    end

    helper_method :current_user

    def sign_in(user)
      session[:user_id] = user.id
      @current_user = user
    end

    def sign_out(user)
      session.delete :user_id
      @current_user = nil
    end

    def authenticate_user!
      redirect_to new_sessions_path, alert: "Пожалуйста, авторизируйтесь!" unless current_user
    end
  end
end
