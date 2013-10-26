AcreCare::Application.routes.draw do

  resources :donations


  resources :parcels

  root :to => "parcels#index"

  match "/thanks" => "pages#thanks"
  match "/certificate" => "pages#certificate"
  match "/ecard" => "pages#ecard"
  match "/about" =>"pages#about"
  match "/donate" => "pages#donate"

end
