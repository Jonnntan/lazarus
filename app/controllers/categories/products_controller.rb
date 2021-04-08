class Categories::ProductsController < ApplicationController

  def index
    find_id
  end

  def find_id
    @category = Category.find(params[:category_id])
    @product = @category.products.find_by(category_id: params[:category_id], id: params[:id])
  end

  def new
    find_id
  end
end
