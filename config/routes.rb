RyoLunch::Application.routes.draw do
  namespace :admin do
    resources :daily_menus, except: [ :show ]
    resources :users, except: [ :show ]
  end
  get "/admin" => redirect("/admin/daily_menus"), as: :admin

  get "registration/activate"
  get "registration/stopping"

  resources :daily_menus, only: [:index, :show]

  root to: 'welcome#top'
end
