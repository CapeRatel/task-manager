class SessionPolicy < ApplicationPolicy
  def new?
    user.nil?
  end

  def create?
    new?
  end

  def destroy?
    user.present?
  end
end