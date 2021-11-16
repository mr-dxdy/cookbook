class ApplicationController < ActionController::Base
  include CurrentUserControllerMethods

  before_action :authenticate_user!
end
