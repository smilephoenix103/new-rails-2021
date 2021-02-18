class Country < ApplicationRecord
	has_many :currencies
	def to_s
		country_en
	end
	def to_s
		continent
	end
end
