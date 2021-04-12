class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def find_id
    @product = Product.find(params[:id])
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    if Brand.exists?
      if Category.exists?
        @product = Product.new
        @product.variants.build
      else
        redirect_to new_category_path, notice: "Error: No exisiting Category found. Please create a Category."
      end
    else
      # flash[:notice] = "Brand does not exist."
      redirect_to new_brand_path, notice: "Error: No exisiting Brand found. Please create a Brand."
    end
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
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
    Product.find(params[:id]).destroy
    redirect_to products_path
  end

  def search
    redirect_to root_path if params[:search].blank?

    @query = params[:search].downcase
    @results = Product.where("lower(title) LIKE :search", search: "%#{@query}%")
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :brand_id, :category_id,
      variants_attributes: [:id, :name, :price, :inventory])
  end

end
