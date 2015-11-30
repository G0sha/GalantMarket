json.array!(@solutions) do |solution|
  json.extract! solution, :id, :title, :description, :price, :sol_img
  json.url solution_url(solution, format: :json)
end
