json.array!(@parents) do |parent|
  json.extract! parent, :first_name, :last_name, :email
  json.url parent_url(parent, format: :json)
end
