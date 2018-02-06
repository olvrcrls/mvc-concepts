class BranchesController < ApplicationController
	before_action :authenticate_user!
	before_action :find_branch, only: [:edit, :update, :destroy]

	def index
		@branches = Branch.all.order("name ASC")
	end

	def new
		@branch = Branch.new
	end

	def create
		@branch = Branch.new(branch_params)
		if @branch.save
			redirect_to branches_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @branch.update(branch_params)
			redirect_to branches_path
		else
			render 'edit'
		end
	end

	def destroy
		@branch.destroy
		redirect_to branches_path
	end

	private
		def branch_params
			params.require(:branch).permit(:name, :city)
		end

		def find_branch
			@branch = Branch.friendly.find(params[:id])
		end
end
