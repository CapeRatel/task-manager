class Admin::BasePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record[1]
  end

  def index?
    user.present? && user.admin?
  end

  def show?
    index?
  end

  def new?
    index?
  end

  def create?
    index?
  end

  def edit?
    index?
  end

  def update?
    index?
  end

  def destroy?
    index?
  end
end