json.array!(@messages) do |message|
  json.extract! message, :friendship_id, :data, :parent_approval, :friend_parent_approval, :expiry_date
  json.url message_url(message, format: :json)
end
