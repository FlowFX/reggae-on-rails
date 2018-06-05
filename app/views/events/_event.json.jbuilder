json.extract! event, :id, :title, :date, :description, :image_url, :link_url, :created_at, :updated_at
json.url event_url(event, format: :json)
