class CategoriesController < ApplicationController
  before_action :find_id, only: [:edit, :update, :show, :destroy]

  def index
    @categories = Category.all
  end

  def find_id
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to category_path(@category)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to category_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    @category.products.destroy_all
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
