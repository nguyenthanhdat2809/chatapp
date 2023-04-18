class User < ApplicationRecord
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
