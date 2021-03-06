class User < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

  has_many :transactions, dependent: :destroy
end
