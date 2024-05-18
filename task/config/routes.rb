Rails.application.routes.draw do

  resources :stories, only: [:index, :create]

  get "/users/:user_id/stories", to: "stories#index"
  post "/stories", to: "stories#create"
  get "/stories/top_stories", to: "stories#top_stories"
  post "/stories/:story_id/reviews", to: "reviews#create"

end
