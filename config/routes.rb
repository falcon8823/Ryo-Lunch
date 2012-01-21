RyoLunch::Application.routes.draw do
  root to: 'Welcome#top'

  resources :menus

end
