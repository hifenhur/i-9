json.array!(@maps) do |map|
  json.extract! map, :name, :image
  json.url map_url(map, format: :json)
end
