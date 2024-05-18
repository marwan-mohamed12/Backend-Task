Rails.application.routes.draw do
  resources :users, only: [] do
    resources :stories, only: [:index, :create] do
    end
  end
  post "/stories/:story_id/reviews", to: "reviews#create"

  get 'top_stories', to: 'stories#top_stories'
end
