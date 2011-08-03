Takeone::Application.routes.draw do
  resources :requests

  resources :shifts
  root :to => "splash#index"

  match "/manager" => "shifts#manager"

  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
