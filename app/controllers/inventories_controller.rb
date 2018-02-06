class InventoriesController < ApplicationController
	before_action :find_inventory, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!

	def index
		@inventories = Inventory.all.order("product_id ASC")
	end

	def new
		@inventory = current_user.inventories.build
		@products = products_list
		@branches = branches_list
	end

	def create
		@inventory = current_user.inventories.build(inventory_parameters)
		@inventory.branch_id = params[:branch_id]
		@inventory.product_id = params[:product_id]
		if @inventory.save
			redirect_to inventories_path
		else
			render 'new'
		end
	end

	def edit
		@products = products_list
		@branches = branches_list
	end

	def update
		if @inventory.update(inventory_parameters)
			redirect_to inventories_path
		else
			render 'edit'
		end
	end

	def destroy
		@inventory.destroy
		redirect_to inventories_path
	end


	private
		def inventory_parameters
			params.require(:inventory).permit(:product_id, :branch_id, :stock, :price)
		end

		def products_list
			Product.all.map{ |product| [product.name, product.id] }
		end

		def branches_list
			Branch.all.map{ |branch| [branch.name, branch.id] }
		end

		def find_inventory
			@inventory = Inventory.find(params[:id])
		end

end
