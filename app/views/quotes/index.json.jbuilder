json.array!(@quotes) do |quote|
  json.extract! quote, :id, :character_quote
  json.url quote_url(quote, format: :json)
end
