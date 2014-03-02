# == Route Map (Updated 2014-03-01 19:54)
#
#     application_agenda_items GET    /applications/:application_id/agenda_items(.:format)          agenda_items#index
#                              POST   /applications/:application_id/agenda_items(.:format)          agenda_items#create
#  new_application_agenda_item GET    /applications/:application_id/agenda_items/new(.:format)      agenda_items#new
# edit_application_agenda_item GET    /applications/:application_id/agenda_items/:id/edit(.:format) agenda_items#edit
#      application_agenda_item GET    /applications/:application_id/agenda_items/:id(.:format)      agenda_items#show
#                              PUT    /applications/:application_id/agenda_items/:id(.:format)      agenda_items#update
#                              DELETE /applications/:application_id/agenda_items/:id(.:format)      agenda_items#destroy
#                 applications GET    /applications(.:format)                                       applications#index
#                              POST   /applications(.:format)                                       applications#create
#              new_application GET    /applications/new(.:format)                                   applications#new
#             edit_application GET    /applications/:id/edit(.:format)                              applications#edit
#                  application GET    /applications/:id(.:format)                                   applications#show
#                              PUT    /applications/:id(.:format)                                   applications#update
#                              DELETE /applications/:id(.:format)                                   applications#destroy
#                    workshops GET    /workshops(.:format)                                          workshops#index
#                              POST   /workshops(.:format)                                          workshops#create
#                 new_workshop GET    /workshops/new(.:format)                                      workshops#new
#                edit_workshop GET    /workshops/:id/edit(.:format)                                 workshops#edit
#                     workshop GET    /workshops/:id(.:format)                                      workshops#show
#                              PUT    /workshops/:id(.:format)                                      workshops#update
#                              DELETE /workshops/:id(.:format)                                      workshops#destroy
#                     sponsors GET    /sponsors(.:format)                                           sponsors#index
#                              POST   /sponsors(.:format)                                           sponsors#create
#                  new_sponsor GET    /sponsors/new(.:format)                                       sponsors#new
#                 edit_sponsor GET    /sponsors/:id/edit(.:format)                                  sponsors#edit
#                      sponsor GET    /sponsors/:id(.:format)                                       sponsors#show
#                              PUT    /sponsors/:id(.:format)                                       sponsors#update
#                              DELETE /sponsors/:id(.:format)                                       sponsors#destroy
#           apply_for_workshop        /apply_for_workshop/:workshop_id(.:format)                    applications#new
#                     the_team        /the_team(.:format)                                           users#the_team
#      add_sponsor_to_workshop        /add_sponsor_to_workshop(.:format)                            workshops#add_sponsor_to_workshop
#                         root        /                                                             home#index
#                         root        /                                                             home#index
#             new_user_session GET    /users/sign_in(.:format)                                      users/sessions#new
#                 user_session POST   /users/sign_in(.:format)                                      users/sessions#create
#         destroy_user_session DELETE /users/sign_out(.:format)                                     users/sessions#destroy
#                user_password POST   /users/password(.:format)                                     users/passwords#create
#            new_user_password GET    /users/password/new(.:format)                                 users/passwords#new
#           edit_user_password GET    /users/password/edit(.:format)                                users/passwords#edit
#                              PUT    /users/password(.:format)                                     users/passwords#update
#     cancel_user_registration GET    /users/cancel(.:format)                                       users/registrations#cancel
#            user_registration POST   /users(.:format)                                              users/registrations#create
#        new_user_registration GET    /users/sign_up(.:format)                                      users/registrations#new
#       edit_user_registration GET    /users/edit(.:format)                                         users/registrations#edit
#                              PUT    /users(.:format)                                              users/registrations#update
#                              DELETE /users(.:format)                                              users/registrations#destroy
#       accept_user_invitation GET    /users/invitation/accept(.:format)                            users/invitations#edit
#       remove_user_invitation GET    /users/invitation/remove(.:format)                            users/invitations#destroy
#              user_invitation POST   /users/invitation(.:format)                                   users/invitations#create
#          new_user_invitation GET    /users/invitation/new(.:format)                               users/invitations#new
#                              PUT    /users/invitation(.:format)                                   users/invitations#update
#                        users GET    /users(.:format)                                              users#index
#                              POST   /users(.:format)                                              users#create
#                     new_user GET    /users/new(.:format)                                          users#new
#                    edit_user GET    /users/:id/edit(.:format)                                     users#edit
#                         user GET    /users/:id(.:format)                                          users#show
#                              PUT    /users/:id(.:format)                                          users#update
#                              DELETE /users/:id(.:format)                                          users#destroy
#                         page GET    /*id                                                          high_voltage/pages#show
#

RailsLadiesAthens::Application.routes.draw do

  resources :applications do
    resources :agenda_items
  end
  resources :workshops
  resources :sponsors

  match 'apply_for_workshop/:workshop_id', :to => "applications#new", as: :apply_for_workshop

  match 'users/profile', :to => 'users#profile'
  match 'users/edit_profile', :to => 'users#edit_profile', as: :edit_profile
  match 'the_team', :to => 'users#the_team', as: :the_team
  match 'add_sponsor_to_workshop', :to => 'workshops#add_sponsor_to_workshop', as: :add_sponsor_to_workshop
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => {:passwords => "users/passwords", :registrations => "users/registrations", :sessions => "users/sessions", :invitations => "users/invitations"}
  resources :users
end
