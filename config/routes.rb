Rails.application.routes.draw do
  resources :cares
  resources :abouts
  # resources :contacts
  # resources :news
  # resources :works
  # resources :users

  post "/post_news", to: "news#post_news"
  get "/all_news", to: "news#all_news"

  post "/post_work", to: "works#post_work"
  get "/all_work", to: "works#all_work"

  post "/post_about", to: "abouts#post_about"
  get "/all_about", to: "abouts#all_about"

  post "/post_care", to: "cares#post_care"
  get "/all_care", to: "cares#all_care"

  get "/admin/edit-news/:id", to: "news#show"

  post "/admin/signin", to: "users#admin_signin"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
