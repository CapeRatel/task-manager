class User::BasePolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record[1]
  end

  def index?
    user.present? && user.user?
  end

  def show?
    user.present? && user.id == record.user_id
  end

  def new?
    index?
  end

  def create?
    new?
  end

  def edit?
    show?
  end

  def update?
    edit?
  end

  def destroy?
    edit?
  end
end