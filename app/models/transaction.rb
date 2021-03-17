class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :transaction_groups, dependent: :destroy

  def group_id
    transaction_groups.first.group_id unless transaction_group_ids.empty?
  end
end
