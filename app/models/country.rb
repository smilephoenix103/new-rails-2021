class Country < ApplicationRecord
	has_many :currencies
	def to_s
		country_en
	end
end
