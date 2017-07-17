class User::BasePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record[1]
  end

  def index?
    user.present?
  end

  def show?
    user.present? && user.id == record.user_id
  end

  def new?
    user.present?
  end

  def create?
    new?
  end

  def edit?
    user.present? && user.id == record.user_id
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end