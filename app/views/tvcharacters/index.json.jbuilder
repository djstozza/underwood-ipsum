json.array!(@tvcharacters) do |tvcharacter|
  json.extract! tvcharacter, :id, :name
  json.url tvcharacter_url(tvcharacter, format: :json)
end
