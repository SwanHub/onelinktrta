Rails.application.routes.draw do
  get "/", to: "articles#index"
  get "/all", to: "articles#all"
  get "/learn", to: "articles#learn"
  get "/video", to: "articles#video"
  get "/text", to: "articles#text"
  get "/music", to: "articles#music"
  get "/game", to: "articles#game"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
