Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'books#top'
  resources :books, only:[:show, :create, :edit, :update, :destroy, :index]
end
