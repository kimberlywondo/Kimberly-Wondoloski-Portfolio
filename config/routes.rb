Rails.application.routes.draw do
  root 'welcome#index'
  get '/about', to: 'welcome#about'
  get '/projects', to: 'welcome#projects'
  get '/contact', to: 'welcome#contact'
  get '/blog', to: 'posts#index'
  get '/resume', to: 'welcome#resume'

  devise_for :admins
  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

   resources :posts
end
