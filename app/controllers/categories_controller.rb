class CategoriesController < ApplicationController
  before_action :find_category, only: ['edit', 'update', 'destroy']
  def index
  	@categories = Category.all.order("name ASC")
  end

  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		redirect_to categories_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @category.update(category_params)
  		redirect_to categories_path(@category)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	if @category.destroy
  		redirect_to categories_path
  	end
  end

  private
  	def category_params
  		params.require(:category).permit(:name)
  	end
  	def find_category
  		@category = Category.friendly.find(params[:id])
  	end
end
