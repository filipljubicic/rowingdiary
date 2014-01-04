json.array!(@pbs) do |pb|
  json.extract! pb, :id, :distance, :split, :time, :date, :rate, :watt
  json.url pb_url(pb, format: :json)
end
