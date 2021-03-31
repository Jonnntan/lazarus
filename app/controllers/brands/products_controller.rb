class Brands::ProductsController < ApplicationController
  def index
    find_id
    @brands = Brand.all
    @products = Product.all
  end

  def find_id
    @brand = Brand.find(params[:brand_id])
    @product = Product.find_by(brand_id: @brand.id)
  end

  def show
    find_id
  end

  def new
    find_id
    @product = @brand.products.new
  end

  def create
    find_id
    @product = @brand.products.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    find_id
  end

  def update
    find_id

    if @brand.products.update(product_params)
      redirect_to brand_products_path
    else
      render :edit
    end
  end

  # def destroy
  #   find_id
  #   @product.destroy
  #   @product.variants.destroy_all

  #   redirect_to root_path
  # end

  # def search
  #   redirect_to root_path if params[:search].blank?

  #   @query = params[:search].downcase
  #   @results = Product.where("lower(title) LIKE :search", search: "%#{@query}%")
  # end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :brand_id)
  end
end