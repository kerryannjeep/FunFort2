json.array!(@children) do |child|
  json.extract! child, :first_name, :parent_id
  json.url child_url(child, format: :json)
end
