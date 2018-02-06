class Product < ApplicationRecord
	belongs_to :category
	belongs_to :brand
	has_many :inventories

	validates_presence_of :name, :brand_id, :category_id, :description
	validates_uniqueness_of :name
	# validates :brand_id, :presence => true
	# validates :category_id, :presence => true

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
