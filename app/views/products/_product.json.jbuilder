json.extract! product, :id, :name, :price, :qty, :description, :seller_id, :created_at, :updated_at
json.url product_url(product, format: :json)
