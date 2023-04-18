class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
    authentication_keys: [:email]

  enum permission: {manager: 0, admin: 1}
end