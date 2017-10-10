class ApplicationController < ActionController::Base
	protect_from_forgery with: :null_sessions
	require 'csv'
	 def processCSVFile(file)
    text_file = TextFile.new({name: file.original_filename, content: file.read})
    text_file.save
CSV.parse(text_file.content, converters: :numeric);

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
	
	def intervals
	sum = 0
	current_row = 0
	best_interval = 0
	file = CSV.parse(params[:file].read)
	if file.length < 30
		sum = file.map{|n| n[0]}.reduce{|a, b|a.to_i+b.to_i} 
		render plain: '%.2f' % sum
 	else  
	while current_row < (file.length-29) do
		i = 0
		while i < 30
		sum = file[curent_row+i][0].to_i + sum;
		i = 1 + i
		end  
	        if best_interval < sum
		best_interval = sum
		end 
	sum= 0;
	current_row+=1  
	end
	best_interval = best_interval.ceil
	render plain: "%.2f" % best_interval 
	end
	end

	Incomes_col = 0;
	ColX = 0;    
    def lin_regressions
        arr = processCSVFile(params["file"]);
        xs = (1..arr.length).to_a;
        ys =  arr.map { |n| n[Incomes_col] };
        linear = Regression::Linear.new(xs, ys);
        a = linear.slope;
        b = linear.intercept;
        render plain: ('%.6f' % a + "," + '%.6f' %  b).html_safe;        
	end
end
end
