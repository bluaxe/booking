Demo::Application.routes.draw do
root 'home#index'

get '/register' , to: 'user#new'
get '/logout' , to: 'user#logout'
get '/login' , to: 'user#login'
post '/login' , to: 'user#login'

resources :user

get '/placemanage' , to: 'place#index'
get '/place/photo/:id', to: 'place#photo'
post '/place/upload/:id', to: 'place#upload'
resources :place,:room

post '/timetable' ,to: 'time_table#update'

get '/p/:id/', to: 'home#place_detail'
post '/p/:id/', to: 'home#place_detail'

get '/order/new', to: 'order#new'
get '/order/destroy/:id', to: 'order#destroy'
post '/order/create', to: 'order#create'

get '/admin' , to: 'admin#index'
get '/admin/grant/:id', to: 'admin#grant'

get '/verify/:code', to: 'user#verify'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
