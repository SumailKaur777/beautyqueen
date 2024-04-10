require 'httparty'

# Fetch data from the API
response = HTTParty.get('https://makeup-api.herokuapp.com/api/v1/products.json')

# Parse JSON response
products_data = JSON.parse(response.body)

# Seed products
products_data.each do |product_data|
  # Skip products without a valid price
  next unless product_data['price'].is_a?(Numeric)

  # Set a default price if the price is blank or not a number
  price = product_data['price'].presence || 0

  Product.find_or_create_by!(
    name: product_data['name'],
    description: product_data['description'],
    price: price
    # Add other fields as necessary
  )
end

# Seed admin user (only in development environment)
if Rails.env.development?
  AdminUser.find_or_create_by!(email: 'admin@example.com') do |user|
    user.password = 'password'
    user.password_confirmation = 'password'
  end
end
