Rails.application.routes.draw do
  get "/", to: "articles#index"
  get "/video", to: "articles#video"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
