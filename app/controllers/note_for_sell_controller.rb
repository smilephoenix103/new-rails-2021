class NoteForSellController < ApplicationController
  def index
  	# Customer.joins(:orders).where('orders.created_at' => time_range).distinct
  	# @country = Country.joins(:currencies).where(Currency.joins(:notes).where('notes.status' => 'FOR SELL'))
# Customer
  # .select('customers.id, customers.last_name, reviews.body')
  # .joins(:reviews)
  # .where('reviews.created_at > ?', 1.week.ago)


    # @country = Country.select('countries.id').joins(:currencies).where('currencies.id' == 200).count
    # Vote.joins(lunch: :provider).select('lunches.date, providers.name, votes.*').where(lunch_id: 1)
    # @country = Country.select.joins(Currency.joins(:notes))
    # @sale =  @currency.notes.select { |note| note.status == 'FOR SELL' }
    # @countrt = @country.currencies.select{ |currency| currency.cod == 'PLN'}
    @countries = Country.find_by_sql("SELECT Distinct(country_en), cou.id FROM countries cou, currencies cur, notes note
 							    	   WHERE cou.id = cur.country_id 
							   			 AND cur.id = note.currency_id
							   			 AND note.status = 'FOR SELL'
							  		   ORDER BY country_en")
    puts "+++++++++++++++++++++++++++TEST++++++++++++++++++++++++++"
    @countries.each do |c|
  		puts c
    end
  	puts "+++++++++++++++++++++++++++TEST++++++++++++++++++++++++++"
  end
end
