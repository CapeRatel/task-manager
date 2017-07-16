require 'rails_helper'

describe SessionPolicy do
  let(:user) { create(:user) }
  let(:admin) { create(:user, role: 1) }

  subject { SessionPolicy }

  permissions :new?, :create? do
    it 'only guest can sign in' do
      expect(subject).to permit(nil, :session)
      [user, admin].each do |role|
        expect(subject).to_not permit(role, :session)
      end
    end
  end
end