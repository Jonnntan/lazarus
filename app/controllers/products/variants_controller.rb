class Products::VariantsController < ApplicationController
  def index
    find_id
    @products = Product.all
    @variants = Variant.all
  end

  def find_id
    @product = Product.find(params[:product_id])
    @variant = Variant.find_by(product_id: @product.id)
  end

  def show
    find_id
  end

  def new
    find_id
    @variant = @product.variants.new
  end

  def create
    find_id
    @variant = @product.variants.new(variant_params)
    if @variant.save
      redirect_to product_variants_path(@product)
    else
      render :new
    end
  end

  def edit
    find_id
  end

  def update
    find_id

    if @variant.update(variant_params)
      redirect_to product_variant_path
    else
      render :edit
    end
  end

  def destroy
    find_id
    @variant.destroy
    redirect_to root_path
  end

  private

  def variant_params
    params.require(:variant).permit(:name, :price, :inventory, :product_id)
  end
end
