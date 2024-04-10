# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  def show
    @category = Category.find_by(name: params[:id])
    @products = Product.where(category: @category)
  end
end
