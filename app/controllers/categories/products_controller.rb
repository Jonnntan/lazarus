class Categories::ProductsController < ApplicationController

  def index
    @categories = Category.all
  end

  def find_id
    @category = Category.find(params[:id])
    @product = @category.products.find_by(category_id: params[:category_id], id: params[:id])
  end
end
