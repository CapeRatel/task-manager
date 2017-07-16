class User < ApplicationRecord
  enum role: { user: 0, admin: 1 }

  validates :email, email: true, presence: true, uniqueness: true

  has_secure_password
end
