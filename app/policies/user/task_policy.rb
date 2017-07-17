class User::TaskPolicy < ::User::BasePolicy
  def index?
    user.present? && user.user?
  end

  def new?
    index?
  end

  def create?
    new?
  end

  def change_state?
    edit?
  end
end