BusTimetable::Application.routes.draw do
  root :to => 'welcome#index'
  resources :lines
  resources :stations do
    resources :lines, :only => [:update]
  end
end
