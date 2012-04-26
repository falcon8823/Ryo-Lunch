RyoLunch::Application.routes.draw do
  get "registration/activate"

  get "registration/stopping"

  resources :daily_menus

  root to: 'Welcome#top'

end
