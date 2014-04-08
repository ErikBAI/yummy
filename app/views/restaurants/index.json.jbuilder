json.array!(@restaurants) do |restaurant|
  json.extract! restaurant, :id, :id_number, :name
  json.url restaurant_url(restaurant, format: :json)
end
