AcreCare::Application.routes.draw do

  resources :parcels

  root :to => "parcels#index"

  match "/thanks" => "pages#index"
  match "/certificate" => "pages#download"
  match "/about" =>"pages#about"

end
