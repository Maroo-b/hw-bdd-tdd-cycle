Rottenpotatoes::Application.routes.draw do
  resources :movies do
    get 'same_movie_director', as: 'same_director', on: :member
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/movies')
end
