json.array!(@services) do |service|
  json.extract! service, :id, :title, :description, :price
  json.url service_url(service, format: :json)
end
