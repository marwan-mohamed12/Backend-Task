Rails.application.routes.draw do
  resources :users, only: [] do
    resources :stories, only: [:index, :create] do
      resources :reviews, only: [:create]
    end
  end

  get 'top_stories', to: 'stories#top_stories'
end
