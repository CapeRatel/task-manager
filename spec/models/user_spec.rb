require 'rails_helper'

RSpec.describe User, type: :model do
  it { should define_enum_for(:role).with(%i(user admin)) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
end
