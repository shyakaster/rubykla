Rails.application.routes.draw do
  devise_for :authors
  root "blog/pages#show", page: "index"

  namespace :authors do
    resources :posts do
      put 'publish' => 'posts#publish', on: :member
      put 'unpublish' => 'posts#unpublish', on: :member
    end
  end

   scope module: 'blog' do
      get 'posts' => 'posts#index', as: :posts
      get 'posts/:id' => 'posts#show', as: :post
      get 'pages/:page' => 'pages#show'
    end
end
