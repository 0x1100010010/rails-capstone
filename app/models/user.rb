class User < ApplicationRecord
  validates :name, length: { maximum: 30 }
  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }

  has_many :transactions, dependent: :destroy
  has_many :groups

  def external_transactions
    transactions.select { |t| t.transaction_group_ids.empty? }
  end

  def total_amount
    sum=0
    transactions.each { |t| sum+=t.amount.to_i }
    sum
  end
end
