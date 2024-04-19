# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: 'Category was successfully created.'
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    # @products = Product.where(category: @category)
  end

  def show
    @category = Category.find(params[:id]) || Category.new
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
