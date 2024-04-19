class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :_product_new, :_product_recently_updated, :_product_on_sale]
  before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @products = Product.all.page(params[:page]).per(10) # Paginate with 10 products per page

    if params[:search].present?
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    elsif params[:category].present?
      category = Category.find_by(name: params[:category])
      if category
        @products = category.products.page(params[:page]).per(10)
      else
        @products = []
      end
    end

    @products_on_sale = Product.where(on_sale: true)
    @new_products = Product.where('created_at >= ?', 3.days.ago)
    @recently_updated_products = Product.where('updated_at >= ?', 3.days.ago)
  end

  def show
    @product = Product.find(params[:id])
    
    if @product.on_sale?
      render partial: 'product_on_sale', locals: { product: @product }
    elsif @product.created_at >= 3.days.ago
      render partial: 'product_new', locals: { product: @product }
    elsif @product.updated_at >= 3.days.ago
      render partial: 'product_recently_updated', locals: { product: @product }
    else
      render partial: 'product', locals: { product: @product }
    end
  end
    
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
