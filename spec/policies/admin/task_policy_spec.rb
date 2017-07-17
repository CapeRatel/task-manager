require 'rails_helper'

describe Admin::TaskPolicy do
  let!(:admin) { create(:user, role: 1) }
  let!(:user) { create(:user) }
  let!(:task) { create(:task, user: user) }

  subject { Admin::TaskPolicy }

  permissions :index?, :new?, :create?, :edit?, :update?, :destroy? do
    it 'admin can see all tasks' do
      expect(subject).to permit(admin, [:user, :task])
      expect(subject).to_not permit(nil, [:user, :task])
      expect(subject).to_not permit(user, [:user, :task])
    end
  end
end