json.array!(@products) do |product|
  json.extract! product, :id, :title, :group, :subgroup, :description, :price, :subprice
  json.url product_url(product, format: :json)
end
