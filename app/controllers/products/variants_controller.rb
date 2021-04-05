class Products::VariantsController < ApplicationController
  before_action :find_id

  def index
    @products = Product.all
    @variants = Variant.all
  end

  def find_id
    @product = Product.find(params[:product_id])
    @variant = Variant.find_by(product_id: params[:product_id], id: params[:id])
  end

  def show
  end

  def new
    @variant = @product.variants.new
  end

  def create
    @variant = @product.variants.new(variant_params)
    if @variant.save
      redirect_to product_variants_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @variant.update(variant_params)
      redirect_to product_variant_path
    else
      render :edit
    end
  end

  def destroy
    @variant.destroy
    redirect_to root_path
  end

  private

  def variant_params
    params.require(:variant).permit(:name, :price, :inventory, :product_id)
  end
end
