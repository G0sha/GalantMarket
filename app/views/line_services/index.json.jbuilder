json.array!(@line_services) do |line_service|
  json.extract! line_service, :id, :service_id, :cart_id
  json.url line_service_url(line_service, format: :json)
end
