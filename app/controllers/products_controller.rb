class ProductsController < ApplicationController
	before_action :find_product, only: ['edit', 'update', 'destroy']
	before_action :authenticate_user!, except: ['index']

	def index
		@products = Product.all.order("name ASC")
	end

	def new
		@product = current_user.products.build
		# @categories = category_list
		# @brands = brand_list
	end

	def create
		@product = current_user.products.build(product_params)
		@product.brand_id = params[:brand_id]
		@product.category_id = params[:category_id]
		if @product.save
			redirect_to products_path
		else
			render 'new'
		end
	end

	def edit
		@categories = category_list
		@brands = brand_list
	end

	def update
		@product.category_id = params[:category_id]
		@product.brand_id = params[:brand_id]
		if @product.update(product_params)
			redirect_to products_path(@product)
		else
			render 'edit'
		end
	end

	def destroy
		@product.destroy
		redirect_to products_path
	end


	private
		def product_params
			params.require(:product).permit(:name, :description, :category_id, :brand_id)
		end

		def find_product
			@product = Product.friendly.find(params[:id])
		end

		def brand_list
			Brand.all.map{ |brand| [brand.name, brand.id] }
		end

		def category_list
			Category.all.map{ |category| [category.name, category.id] }
		end
end
