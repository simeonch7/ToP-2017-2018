require 'csv'

class FiltersController < ApplicationController

    def create
	doc = params[:file]
	sum=0;    
	CSV.foreach(doc.path) do |row|
		if row[2].to_i % 2!=0 
		sum+=row[1].to_f
		end
	end 
	sum=sum.ceil
	render plain: '%.2f' % sum
    end
end
