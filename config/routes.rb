Takeone::Application.routes.draw do
  resources :shifts
  root :to => "shifts#index"

  match "/manager" => "shifts#manager"

  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
