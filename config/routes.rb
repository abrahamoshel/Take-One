Takeone::Application.routes.draw do
  devise_for :employees, :path_names => { :sign_in => 'login', :sign_out => 'logout', :sign_up => 'register'}

  resources :holidays, :except => :index

  resources :requests, :except => :index

  resources :shifts

  devise_for :employees do
    get '/', :to => "devise/sessions#new"
  end

  root :to => "devise/sessions#new"
  match '/retail' => "splash#index", :as => :employee_root

  match "/manager" => "shifts#manager"
  match "admin" => "holidays#index"

  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
