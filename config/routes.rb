Rails.application.routes.draw do
  get '/buildings',                      to: 'buildings#index'
  get '/buildings/zipcode_distribution', to: 'buildings#zipcode_distribution'
  get '/buildings/year_distribution',    to: 'buildings#year_distribution'
end
