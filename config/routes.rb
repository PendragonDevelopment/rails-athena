# == Route Map (Updated 2014-02-17 15:18)
#
#                     root        /                              home#index
#                     root        /                              home#index
#         new_user_session GET    /users/sign_in(.:format)       users/sessions#new
#             user_session POST   /users/sign_in(.:format)       users/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)      users/sessions#destroy
#            user_password POST   /users/password(.:format)      users/passwords#create
#        new_user_password GET    /users/password/new(.:format)  users/passwords#new
#       edit_user_password GET    /users/password/edit(.:format) users/passwords#edit
#                          PUT    /users/password(.:format)      users/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)        users/registrations#cancel
#        user_registration POST   /users(.:format)               users/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)       users/registrations#new
#   edit_user_registration GET    /users/edit(.:format)          users/registrations#edit
#                          PUT    /users(.:format)               users/registrations#update
#                          DELETE /users(.:format)               users/registrations#destroy
#                    users GET    /users(.:format)               users#index
#                          POST   /users(.:format)               users#create
#                 new_user GET    /users/new(.:format)           users#new
#                edit_user GET    /users/:id/edit(.:format)      users#edit
#                     user GET    /users/:id(.:format)           users#show
#                          PUT    /users/:id(.:format)           users#update
#                          DELETE /users/:id(.:format)           users#destroy
#                     page GET    /*id                           high_voltage/pages#show
#

RailsLadiesAthens::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:passwords => "users/passwords", :registrations => "users/registrations", :sessions => "users/sessions", :invitations => "users/invitations"}
  resources :users
end
