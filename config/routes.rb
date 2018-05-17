Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :subjects
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/qr_code" => "home#generate_qr_code"
  get "/attending_authentication" => "home#student_attend"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  # get "/subjects" => "subjects#new", as: "subjects"
  # post "/subjects" => "subjects#create"
  # get "/subjects/index" => "subject#show"

end
