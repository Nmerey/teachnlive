Rails.application.routes.draw do
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

# user sign in for all
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  post  '/create_student' => 'lectures#create_student'
  root 'home#index'
  get "/auth/:provider/callback" => "students#create_from_omniauth"
  get '/new_student' => 'lectures#new_student'

  get "/attending_authentication" => "home#student_attend"
  post "/lectures" => "lectures#create"
  resources :lectures, only: [:index,:new,:show] do
    get "/qr" => "lectures#qr_code"
    get '/student_list' => 'lectures#student_list'
    get '/sign_up' => "students#sign_up"
  end

  get '/sign_up/students' => "students#new_student"
  
# Admin
  get '/admin' => 'admin#admin_panel'
  post '/add_student' => 'admin#add_student'
  post '/add_teacher' => 'admin#add_teacher'
  post '/add_subject' => 'admin#add_subject'
  get '/dashboard' => 'admin#dashboard'
  post '/date' => 'admin#reported'
end
