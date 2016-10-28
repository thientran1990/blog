Rails.application.routes.draw do
  resources :tests
  	get 'articles/new'

	get 'welcome/index'
	resources :articles do
  		resources :comments
 	end
 / root 'welcome#index' dong chi dia chi trang chu s/
 	root 'articles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
