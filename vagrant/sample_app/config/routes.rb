Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'posts/new'

  get 'top' => 'root#top'

  post 'posts' => 'posts#create'

  get 'posts' => 'posts#index'

  get 'posts/:id' => 'posts#show',as: 'post'

  get 'posts/:id/edit' => 'posts#edit',as: 'edit_post'

  patch 'posts/:id' => 'posts#update', as: 'update_post'

  delete 'posts/:id' => 'posts#destroy', as: 'destroy_post'
end
