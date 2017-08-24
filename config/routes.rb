Rails.application.routes.draw do
  root 'home#index'

  get 'ping', to: 'ping#index'

  get 'rave', to: 'rave#index'
  get 'home/toggle_alert', to: 'home#toggle_alert'

end
