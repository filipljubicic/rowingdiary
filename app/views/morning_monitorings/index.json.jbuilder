json.array!(@morning_monitorings) do |morning_monitoring|
  json.extract! morning_monitoring, :id, :hr, :sleep, :notes
  json.url morning_monitoring_url(morning_monitoring, format: :json)
end
