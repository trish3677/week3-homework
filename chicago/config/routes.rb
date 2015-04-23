Rails.application.routes.draw do
 

  get '/places/create' => 'places#create'
  get '/places/new' => 'places#new'
  get '/places' => 'places#index'
  get '/places/:id' => 'places#show'
  get '/places/:id/delete' => 'places#delete'
  get '/places/:id/edit' => 'places#edit'
  get '/places/:id/update' => 'places#update'

end
