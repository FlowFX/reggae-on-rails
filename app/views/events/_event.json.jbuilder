json.extract! event, :id, :title, :date, :description, :url, :venue_id, :created_at, :updated_at
json.url event_url(event, format: :json)
