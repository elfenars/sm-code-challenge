Rails.application.routes.draw do
  get '/buildings', to: 'buildings#index'
  get '/buildings/per_zipcode', to: 'buildings#per_zipcode'
end
