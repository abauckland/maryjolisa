Rails.application.routes.draw do

  resources :dashboards, :only => [:index]
  resources :users, :only => [:index, :show]
  
  resources :companies do
    resource :store, only: [:new, :create]
  end
  resources :helps

  mount Mjweb::Engine, :at => "/"
  mount Mjbook::Engine, :at => "/"

  root :to => redirect('/websites')

  devise_for :users,
    :controllers => { registrations: 'registrations' },
    :path => '',
    :path_names => {:sign_in  => 'login', :sign_out => 'logout' }


  devise_scope :user do
    get '/new_employee' => 'registrations#new_employee'
  end

end
