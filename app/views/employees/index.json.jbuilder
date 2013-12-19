json.array!(@employees) do |employee|
  json.extract! employee, :name, :picture, :info
  json.url employee_url(employee, format: :json)
end
