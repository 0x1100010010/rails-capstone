json.extract! transaction_group, :id, :group_id, :transaction_id, :created_at, :updated_at
json.url transaction_group_url(transaction_group, format: :json)
