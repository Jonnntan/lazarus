class Products::VariantsController < ApplicationController
  def index
    find_id
    @products = Product.all
    @variants = Variant.all
  end

  def find_id
    @product = Product.find(params[:product_id])
    @variant = Variant.find(params[:product_id])
  end

  def new
    find_id
    
  end
end
