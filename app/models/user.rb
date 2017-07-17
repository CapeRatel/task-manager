class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  has_many :tasks, dependent: :destroy

  validates :email, email: true, presence: true, uniqueness: true

  has_secure_password
end
