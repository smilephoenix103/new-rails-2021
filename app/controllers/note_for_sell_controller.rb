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

    # @countries = Country.find_by_sql("SELECT Distinct(country_en), cou.id FROM countries cou, currencies cur, notes note
 			# 				    	   WHERE cou.id = cur.country_id 
				# 			   			 AND cur.id = note.currency_id
				# 			   			 AND note.status = 'FOR SELL'
				# 			  		   ORDER BY country_en")

	@countries = Country.includes(:currencies => :notes).where({ :currencies => { :notes => { status: "FOR SELL"}}}).order(country_en: :asc)
    puts "+++++++++++++++++++++++++++TEST++++++++++++++++++++++++++"
    @countries.each do |c|
  		puts c.inspect
    end
  	puts "+++++++++++++++++++++++++++END+TEST++++++++++++++++++++++++++"

  	puts "***************************TEST2*************************"
    	# Note.includes(:currency => :country).where(:currency => { :country_id => 72}).and(Note.where(status: 'SOLD')).each do |note|
    	Note.includes(:currency => :country).where(:currency => { :country_id => 72}, :status => 'SOLD').each do |note|
    		puts note.status + note.making
    	end
  	puts "***************************END*TEST2*********************"
  end
end
