AcreCare::Application.routes.draw do

  resources :parcels

  root :to => "parcels#index"

  match "/thanks" => "thanks#index"

  match "/certificate" => "thanks#download"


end
