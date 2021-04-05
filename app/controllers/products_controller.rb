class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def find_id
    @product = Product.find(params[:id])
  end

  def show
    find_id
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      if @product.variants.empty?
        variant = Variant.new(name: @product.title, inventory: 1, price: @product.price, product_id: @product.id)
        variant.save
      end
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

    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    find_id

    @product.variants.destroy_all
    @product.destroy

    redirect_to products_path
  end

  def search
    redirect_to root_path if params[:search].blank?

    @query = params[:search].downcase
    @results = Product.where("lower(title) LIKE :search", search: "%#{@query}%")
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :brand_id)
  end
end
