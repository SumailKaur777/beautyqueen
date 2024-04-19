class CartsController < ApplicationController
  def add_to_cart
    product = find_product(params[:id])

    if product
      # Initialize cart in session if it doesn't exist
      session[:cart] ||= {}
      
      # Increment the quantity of the product in the cart
      session[:cart][product.id] ||= 0
      session[:cart][product.id] += 1
  
      # Set flash message
      flash[:notice] = "#{product.name} added to cart."

      # Redirect to the shopping cart page
      redirect_to cart_path
    else
      flash.now[:alert] = "Product not found."
      redirect_back fallback_location: root_path
    end
  end

  def show
    # Retrieve cart items from session
    @cart_items = cart_items_from_session
  end

  def update
    product_id = params[:id]
    quantity = params[:quantity].to_i

    if quantity <= 0
      session[:cart].delete(product_id)
    else
      session[:cart][product_id] = quantity
    end

    redirect_to cart_path
  end

  def remove_item
    product_id = params[:id]
    session[:cart].delete(product_id) if session[:cart].key?(product_id)

    flash[:notice] = "Item removed from cart."
    redirect_to cart_path
  end

  private

  def find_product(id)
    Product.find_by(id: id)
  end

  def cart_items_from_session
    cart_items = []
    if session[:cart].present?
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        if product
          cart_items << { product: product, quantity: quantity }
        else
          session[:cart].delete(product_id)
        end
      end
    end
    cart_items
  end
end
