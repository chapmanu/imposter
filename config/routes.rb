Rails.application.routes.draw do
  root 'home#index'

  get 'ping', to: 'ping#index'

  get 'rave', to: 'rave#index'
  get 'rave_notification', to: 'rave#notification'
  get 'home/toggle_alert', to: 'home#toggle_alert'
  get 'home/toggle_notification', to: 'home#toggle_notification'

end
