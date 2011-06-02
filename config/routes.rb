Takeone::Application.routes.draw do
  resources :shifts
  root :to => "shifts#index"

<<<<<<< HEAD
  match "/manager" => "shifts#manager"
=======
>>>>>>> 6882626e30f05d3b7b8a19225bffcac49b842e11
  match "/shifts/shift_taken/:id" => "shifts#shift_taken"

end
