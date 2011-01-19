Takeone::Application.routes.draw do
  resources :shifts
  root :to => "shifts#index"

end
