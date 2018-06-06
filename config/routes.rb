Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  get "/attending_authentication" => "home#student_attend"
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get '/new_student' => 'lectures#new_student'
  post  '/create_student' => 'lectures#create_student'
  get '/dashboard' => 'lectures#dashboard'
  post '/date' => 'lectures#reported'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root 'home#index'
  get "/auth/:provider/callback" => "students#create_from_omniauth"

  post "/lectures" => "lectures#create"
  resources :lectures, only: [:index,:new,:show] do
    get "/qr" => "lectures#qr_code"
    get '/student_list' => 'lectures#student_list'
    get '/sign_up' => "students#sign_up"
  end

  get '/sign_up/students' => "students#new_student"
end
