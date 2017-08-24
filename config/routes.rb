Rails.application.routes.draw do
  root 'home#index'

  get 'ping', to: 'ping#index'

  get 'rave', to: 'rave#index'
  get 'home/send_alert', to: 'home#send_alert'

end
