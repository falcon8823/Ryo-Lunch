RyoLunch::Application.routes.draw do
  get "registration/activate"

  get "registration/stopping"

  resources :daily_menus, only: [:index, :show]

  root to: 'Welcome#top'

end
