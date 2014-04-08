json.array!(@items) do |item|
  json.extract! item, :id, :dish_id, :quantity, :cart_id
  json.url item_url(item, format: :json)
end
