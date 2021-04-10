class Categories::ProductsController < ApplicationController
  before_action :find_id

  def index
    find_id
  end

  def find_id
    @category = Category.find(params[:category_id])
    @product = @category.products.find_by(category_id: params[:category_id], id: params[:id])
  end

  def new
    @product = @category.products.new
    @product.variants.build
  end

  def create
    @product = @category.products.new(product_params)

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
    if @product.update(product_params)
      redirect_to category_product_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to category_products_path
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :brand_id, :category_id,
      variants_attributes: [:id, :name, :price, :inventory])
  end
end
