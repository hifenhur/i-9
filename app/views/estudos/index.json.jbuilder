json.array!(@estudos) do |estudo|
  json.extract! estudo, :title, :description, :image
  json.url estudo_url(estudo, format: :json)
end
