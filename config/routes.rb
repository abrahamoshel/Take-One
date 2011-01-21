Takeone::Application.routes.draw do
  resources :shifts
  root :to => "shifts#index"

  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
