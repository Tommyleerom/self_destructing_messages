json.extract! message, :id, :report, :password, :created_at, :updated_at
json.url message_url(message, format: :json)
