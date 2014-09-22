TodoList::Application.routes.draw do
  devise_for :users, controllers: {
    sessions:  "sessions"
  }

  resources :users do
    resources :todos
  end

  match '/*path' => 'application#cors_preflight_check', :via => :options
end
