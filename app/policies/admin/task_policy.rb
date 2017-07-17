class Admin::TaskPolicy < ::Admin::BasePolicy
  def change_state?
    user.present? && user.admin?
  end
end