json.array!(@waters) do |water|
  json.extract! water, :id, :distance, :BoatType, :SessionDescription, :crew, :notes
  json.url water_url(water, format: :json)
end
