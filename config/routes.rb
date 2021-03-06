Rails.application.routes.draw do
  get 'errors/not_found'

  get 'errors/internal_server_error'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  resources 'contacts', only: [:new, :create], path_names: { new: '' }
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :authors
  root "blog/pages#show", page: "index"
  resources :leads

  namespace :authors do
    get '/account' => 'accounts#edit', as: :account
    put '/info' => 'accounts#update_info', as: :info
    put '/change_password' => 'accounts#change_password', as: :change_password
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
  end

   scope module: 'blog' do
      get 'posts' => 'posts#index', as: :posts
      get 'posts/:id' => 'posts#show', as: :post
      get 'pages/:page' => 'pages#show'
      post 'pages/:page'=> 'pages#create'
    end
end
