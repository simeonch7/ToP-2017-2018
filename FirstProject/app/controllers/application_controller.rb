class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_sessions
	require 'csv'

	def sums
		
		sum = 0
		doc = params[:file]
		CSV.foreach(doc.path) do |row|
      			sum += row.first.to_f
		end
		sum = sum.ceil
    	render plain: '%.2f'%sum
	end
	
	def filters
	doc = params[:file]
	sum=0;    
	CSV.foreach(doc.path) do |row|
		if row[2].to_i % 2!=0 
		sum+=row[1].to_f
		end
	end 
	sum=sum.ceil
	render plain: '%.2f'%sum
	end
end
