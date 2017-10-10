Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	post '/sums'            => 'sums#create'
	post '/filters'         => 'filters#create'
	post '/intervals'       => 'intervals#create'
	post '/lin_regressions' => 'lin_regressions#create'
end
