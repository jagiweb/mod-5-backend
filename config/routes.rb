Rails.application.routes.draw do
  # resources :cares
  # resources :abouts
  # resources :contacts
  # resources :news
  # resources :works
  # resources :users

  # CONTACTS ROUTES ####
  post "/post_contacts", to: "contacts#post_contacts"
  get "/all_contacts", to: "contacts#all_contacts"
  delete "/admin/delete-contacts/:id", to: "contacts#destroy"

  # NEWS ROUTES #####
  post "/post_news", to: "news#post_news"
  get "/all_news", to: "news#all_news"
  get "/admin/edit-news/:id", to: "news#show"
  patch "/admin/edit-news/:id", to: "news#update"
  delete "/admin/delete-news/:id", to: "news#destroy"

  # WORK ROUTES ####
  post "/post_work", to: "works#post_work"
  get "/all_work", to: "works#all_work"
  get "/admin/edit-works/:id", to: "works#show"
  patch "/admin/edit-works/:id", to: "works#update"
  delete "/admin/delete-works/:id", to: "works#destroy"

  # ABOUT ROUTES ####
  post "/post_about", to: "abouts#post_about"
  get "/all_about", to: "abouts#all_about"
  get "/admin/edit-about/:id", to: "abouts#show"
  patch "/admin/edit-about/:id", to: "abouts#update"
  delete "/admin/delete-about/:id", to: "abouts#destroy"

  # AFTER CARE ROUTES ###
  post "/post_care", to: "cares#post_care"
  get "/all_care", to: "cares#all_care"
  get "/admin/edit-aftercare/:id", to: "cares#show"
  patch "/admin/edit-aftercare/:id", to: "cares#update"
  delete "/admin/delete-aftercare/:id", to: "cares#destroy"


  post "/admin/signin", to: "users#admin_signin"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
