class Inventory < ApplicationRecord
	belongs_to :product
	belongs_to :branch

	def index
		@inventories = Inventory.all.order("stock DESC")
	end
end
