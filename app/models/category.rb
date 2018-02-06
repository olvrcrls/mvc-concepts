class Category < ApplicationRecord
	has_many :products

	validates :name, :presence => true
	
	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
