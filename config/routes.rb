Rails.application.routes.draw do
  
  # goes to home page
  get '/' => 'home#index'
  # changes the page news for home page
  get '/page' => 'home#page'
  # +++++++++++++++++++++++++++++++++++++++
  # +++++++++++++++++++++++++++++++++++++++
  # goes to login page
  get "/login" => 'user#login'
  # logs in the user
  post '/sessions' => 'sessions#create'
  # signs up the user
  post '/user' => 'user#create'
  # logs the user ou
  get "/logOut" => 'user#destroy'
  # +++++++++++++++++++++++++++++++++++++++
  # +++++++++++++++++++++++++++++++++++++++
  # get '/items' => 'items#index'
  post '/items' => 'items#create'
  # +++++++++++++++++++++++++++++++++++++++
  # +++++++++++++++++++++++++++++++++++++++
  get '/item' => 'home#feed'
  # +++++++++++++++++++++++++++++++++++++++
  # +++++++++++++++++++++++++++++++++++++++
 
  # get '/'=>'items#index'
  post '/' => 'items#create'
  
  get '/items' => 'home#item'
  
  post '/comments' => 'comment#create'
  # get '/comments' => 'about#comment'
  get '/newcomments' => 'comment#index'
  
  # get 'submit'=>'news#index'
  get 'submit' => 'news#index'
  # get 'submit/create' => 'news#create'
  # post 'submit/create' => 'news#create'
  post '/news' => 'news#create'
  
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
  
  # namespace 'api' do
  #   namespace 'v0' do
  #     resources :items

  #   end
  # end
  namespace :api, defaults: {format: :json} do
    namespace :v0 do
      resources :item
      post 'item/create' => 'item#create'
    end
  end
  # namespace :api, defaults: {format: :json} do
  #   namespace :v0 do
  #     resources :test
  #   end
  # end


  
end
