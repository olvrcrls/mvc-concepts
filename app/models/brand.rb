class Brand < ApplicationRecord
	has_many :products
	
	# validates :name, :presence => true
	validates_presence_of :name
	validates_uniqueness_of :name
	
	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
