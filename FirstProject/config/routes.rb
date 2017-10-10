Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :text_files
  match '/sums', :to => 'sums#create', :via => [:get]
  match '/filters', :to => 'filters#create', :via => [:get]
  match '/sums', :to => 'sums#create', :via => [:post]
  match '/filters', :to => 'filters#create', :via => [:post]
  match '/intervals', :to => 'intervals#create', :via => [:post]
  match '/lin_regressions', :to => 'lin_regressions#create', :via => [:post]
end
