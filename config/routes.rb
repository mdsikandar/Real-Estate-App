Rails.application.routes.draw do
  devise_for :users
  	resources :projects
 	resources :properties
  	root 'welcome#index'
    get :send_order_mail, to: 'projects#send_order_mail', as: :send_order_mail


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
