class User::TaskPolicy < ::User::BasePolicy
  def change_state?
    edit?
  end
end