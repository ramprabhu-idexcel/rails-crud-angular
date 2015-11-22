json.array!(@products) do |product|
  json.extract! product, :id, :name, :product_category_id
  json.url product_url(product, format: :json)
end
