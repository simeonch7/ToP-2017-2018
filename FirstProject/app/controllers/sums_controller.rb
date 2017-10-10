require 'csv'

class SumsController < ApplicationController  
	def create

		sum = 0
		doc = params[:file]
		CSV.foreach(doc.path) do |row|
      			sum += row.first.to_f
		end
		sum = sum.ceil
    render plain: '%.2f' % sum
  
	end
end
		
