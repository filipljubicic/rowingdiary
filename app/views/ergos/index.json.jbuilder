json.array!(@ergos) do |ergo|
  json.extract! ergo, :id, :description, :score
  json.url ergo_url(ergo, format: :json)
end
