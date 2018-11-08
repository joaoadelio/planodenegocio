Rails.application.routes.draw do
  resources :groups
  resources :answers
  resources :questions
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  get 'homepage/index'

  get 'contextualization/new'
  get 'contextualization/edit'
  get 'contextualization', to: 'contextualization#index'
  post 'contextualization/create'
  post 'contextualization/update'
  delete 'contextualization/destroy'

  get 'business/new'
  get 'business/edit'
  get 'business', to: 'business#index'
  post 'business/create'
  post 'business/update'
  delete 'business/destroy'

  get 'process/new'
  get 'process/edit'
  get 'process', to: 'process#index'
  post 'process/create'
  post 'process/update'
  delete 'process/destroy'

  get 'resources/new'
  get 'resources/edit'
  get 'resources', to: 'resources#index'
  post 'resources/create'
  post 'resources/update'
  delete 'resources/destroy'

  get 'competitiveness/new'
  get 'competitiveness/edit'
  get 'competitiveness', to: 'competitiveness#index'
  post 'competitiveness/create'
  post 'competitiveness/update'
  delete 'competitiveness/destroy'

  get 'marketing/new'
  get 'marketing/edit'
  get 'marketing', to: 'marketing#index'
  post 'marketing/create'
  post 'marketing/update'
  delete 'marketing/destroy'

  get 'finances/new'
  get 'finances/edit'
  get 'finances', to: 'finances#index'
  post 'finances/create'
  post 'finances/update'
  delete 'finances/destroy'

  root 'homepage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
