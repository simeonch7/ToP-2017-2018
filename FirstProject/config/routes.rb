Rails.application.routes.draw do
  match '/sums', :to => 'application#sums', :via => [:post]
  match '/filters', :to => 'application#filters', :via => [:post]
  match '/intervals', :to => 'application#intervals', :via => [:post]
end
