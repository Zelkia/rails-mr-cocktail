Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [ :index, :create, :new, :show ] do
    resources :doses, only: [ :create, :new]
  end

  delete 'doses/:id', to: 'doses#destroy',  as:'dose_destroy'

  root "cocktails#index"
end
