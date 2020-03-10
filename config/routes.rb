Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'github_repositories#search'

  post '/search', to: 'github_repositories#search', as: :github_repositories_search
end
