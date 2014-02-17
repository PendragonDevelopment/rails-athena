class Users::InvitationsController < Devise::InvitationsController
   private
   def resource_params
     params.permit(user: [:name, :email, :invitation_token, :password, :password_confirmation])[:user]
   end
end