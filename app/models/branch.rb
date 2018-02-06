class Branch < ApplicationRecord
	has_many :inventories

	validates :name, :presence => true
	validates :city, :presence => true

	extend FriendlyId
	friendly_id :name, use: :slugged

	def should_generate_new_friendly_id?
		new_record?
	end
end
