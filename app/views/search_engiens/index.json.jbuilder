json.array!(@search_engiens) do |search_engien|
  json.extract! search_engien, :id, :title, :head, :footer
  json.url search_engien_url(search_engien, format: :json)
end
