json.array!(@subgroups) do |subgroup|
  json.extract! subgroup, :id, :title
  json.url subgroup_url(subgroup, format: :json)
end
