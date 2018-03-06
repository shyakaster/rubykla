Rails.application.routes.draw do
  root "blog/pages#show", page: "index"

  namespace :author do
    resources :posts
  end

   scope module: 'blog' do
      get 'posts' => 'posts#index', as: :posts
      get 'posts/:id' => 'posts#show', as: :post
      get 'pages/:page' => 'pages#show'
    end
end
