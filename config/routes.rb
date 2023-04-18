Rails.application.routes.draw do
  root "home#index"

  devise_for :users, :skip => [:registrations], controllers: {
    sessions: 'users/sessions'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
