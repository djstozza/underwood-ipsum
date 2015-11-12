json.array!(@paragraphs) do |paragraph|
  json.extract! paragraph, :id, :quotations, :paragraph_number, :tvcharacter_id, :quotes
  json.url paragraph_url(paragraph, format: :json)
end
