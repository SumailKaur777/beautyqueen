# app/models/cart_item.rb
class CartItem
    attr_reader :product_id, :quantity
  
    def initialize(product_id, quantity = 1)
      @product_id = product_id
      @quantity = quantity
    end
  
    def increment_quantity(quantity = 1)
      @quantity += quantity.to_i
    end
  
    def product
      Product.find_by(id: @product_id)
    end
  
    def total_price
      product.price * quantity
    end
  end
  