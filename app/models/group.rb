class Group < ApplicationRecord
  include ActiveModel::Validations

  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :transaction_groups, dependent: :destroy

  validates :name, length: { maximum: 30 }
  validates :description, presence: true, length: { maximum: 300 }
  validates :icon, presence: true

  def transaction_ids
    transaction_groups.map(&:transaction_id)
  end

  def transaction_sum
    transaction_ids.map { |id| Transaction.find(id).amount.to_i }.sum
  end
end