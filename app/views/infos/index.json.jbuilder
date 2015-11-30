json.array!(@infos) do |info|
  json.extract! info, :id, :description, :info_img
  json.url info_url(info, format: :json)
end
