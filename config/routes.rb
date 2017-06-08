Rails.application.routes.draw do
  root to:'pages#home'
  get "settings" => "pages#settings"
  put "settings/:id" => "pages#settings_update"
  get "day_match" => "pages#create_day_match"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
