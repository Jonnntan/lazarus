class Brands::ProductsController < ApplicationController
  before_action :find_id

  def index
    @brands = Brand.all
    @products = Product.all
  end

  def find_id
    @brand = Brand.find(params[:brand_id])
    @product = @brand.products.find_by(brand_id: params[:brand_id], id: params[:id])
  end

  def show
    find_id
  end

  def new
    @product = @brand.products.new
    @product.variants.build
  end

  def create
    @product = @brand.products.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @brand.products.find_by(brand_id: params[:brand_id], id: params[:id]).destroy

    redirect_to brand_products_path(@product.brand_id)
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :brand_id, :category_id,
      variants_attributes: [:id, :name, :price, :inventory])
  end
end