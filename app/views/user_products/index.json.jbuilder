json.array!(@user_products) do |user_product|
  json.extract! user_product, :id, :user_id, :product_category_id, :product_id, :order_date
  json.url user_product_url(user_product, format: :json)
end
