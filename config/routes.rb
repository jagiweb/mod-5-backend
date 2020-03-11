Rails.application.routes.draw do
  # resources :contacts
  # resources :news
  # resources :works
  # resources :users
  post "/post_news", to: "news#post_news"
  post "/admin/sigin" to: "user#admin_signin"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
