class Group < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :transaction_groups, dependent: :destroy

  def transaction_ids
    transaction_groups.map(&:transaction_id)
  end

  def transaction_sum
    transaction_ids.map { |id| Transaction.find(id).amount.to_i }.sum
  end
end
