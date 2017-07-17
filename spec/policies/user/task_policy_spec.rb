require 'rails_helper'

describe User::TaskPolicy do
  let!(:admin) { create(:user, role: 1) }
  let!(:user) { create(:user) }
  let!(:another_user) { create(:user) }
  let!(:task) { create(:task, user: user) }

  subject { User::TaskPolicy }

  permissions :index?, :new?, :create? do
    it 'user can see' do
      expect(subject).to permit(user, [:user, :task])
      expect(subject).to_not permit(nil, [:user, :task])
      expect(subject).to_not permit(admin, [:user, :task])
    end
  end

  permissions :show?, :edit?, :update?, :destroy? do
    it 'user can edit and remove own task' do
      expect(subject).to permit(user, [:user, task])
    end

    it 'user cant edit and remove another\'s task' do
      expect(subject).to_not permit(admin, [:user, task])
      expect(subject).to_not permit(another_user, [:user, task])
    end
  end
end