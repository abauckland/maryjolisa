json.array!(@plans) do |plan|
  json.extract! plan, :id, :name, :price, :braintree_id, :email, :website, :books, :creditunion, :ecommerce
  json.url plan_url(plan, format: :json)
end
