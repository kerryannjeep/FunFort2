json.array!(@invitations) do |invitation|
  json.extract! invitation, :child_id, :secret_code, :expiry_date, :status, :message_id
  json.url invitation_url(invitation, format: :json)
end
