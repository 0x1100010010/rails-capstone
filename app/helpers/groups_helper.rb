module GroupsHelper
  def transaction_exists?(t)
    @group.transaction_groups.find_by(transaction_id: t.id)
  end
end
