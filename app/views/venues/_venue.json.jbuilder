json.extract! venue, :id, :name, :address, :url, :created_at, :updated_at
json.url venue_url(venue, format: :json)
