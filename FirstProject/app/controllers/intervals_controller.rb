require 'csv'
class IntervalsController < ApplicationController
        def create
	doc = CSV.parse(params[:file].read)     
	sum = 0
	current_row = 1
	biggest_interval = 0
	while current_row<doc.length-30 do
		i = 0
		while i<30
		sum = doc[current_row+i][0].to_i + sum;
		i += 1
		end
		if sum > biggest_interval
			biggest_interval = sum
		end
	sum = 0
	current_row += 1
	end
	biggest_int = biggest_int.ceil
	render plain: "%.2f"%max
end
