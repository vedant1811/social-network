Rails.application.routes.draw do
  resources :profiles do
    resources 'friends', only: [:create] do
      get 'suggestions', on: :collection
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
