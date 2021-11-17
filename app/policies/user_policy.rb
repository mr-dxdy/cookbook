class UserPolicy < ApplicationPolicy
  def create_guest?
    Rails.env.development?
  end
end
