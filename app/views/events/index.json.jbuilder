json.array!(@events) do |event|
  json.extract! event, :id, :eventid, :team, :player
  json.url event_url(event, format: :json)
end
