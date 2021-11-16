class Vkontakte::SessionsController < Vkontakte::ApplicationController
  def new
    form = Vkontakte::SessionForm.new redirect_url: vkontakte_sessions_url
    redirect_to form.new_access_code_url
  end

  # Not POST, only GET
  def create
    form = Vkontakte::SessionForm.new(code: params[:code], redirect_url: vkontakte_sessions_url)
    if email = form.load_email
      user = User.find_or_create_by!(email: email)
      sign_in user

      redirect_to recipes_path
    else
      redirect_to new_session_path, alert: "Не удалось авторизоваться через VK"
    end
  end
end
