Rails.application.routes.draw do
  get 'files/run'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "main#index"

  # Defines the route for the "run" action in the "files" controller
  post "compress", to: "files#run"
end
