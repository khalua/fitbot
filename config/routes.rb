R20130307Fitbot::Application.routes.draw do
  root :to => 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :users, :only => [:index, :new, :create]

  resources :exercises, :only => [:index, :new, :create] do
    collection do #member means a specific id, but collection is a generic... uhm collection
      get 'chart/:activity', :action => 'chart'
    end
  end

end
