json.array!(@line_solutions_items) do |line_solutions_item|
  json.extract! line_solutions_item, :id, :product_id, :solution_id
  json.url line_solutions_item_url(line_solutions_item, format: :json)
end
