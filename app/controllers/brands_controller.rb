class BrandsController < ApplicationController
	before_action :find_brand, only: [:edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@brands = Brand.all.order("name ASC")
	end

	def new
		@brand = Brand.new
	end

	def edit
	end

	def update
		if @brand.update(brand_params)
			redirect_to edit_brand_path(@brand)
		else
			render 'edit'
		end
	end

	def create
		@brand = Brand.new(brand_params)
		if @brand.save
			redirect_to brands_path
		else
			render 'new'
		end
	end

	def destroy
		@brand.destroy
		redirect_to brands_path
	end

	private
		def brand_params
			params.require(:brand).permit(:name)
		end

		def find_brand
			@brand = Brand.friendly.find(params[:id])
		end
end
