class SessionsController < ApplicationController
    skip_before_action :authenticated_user!
    
    def new;end

    def create
        if (user = User.authenticate_by({email: params[:email], password: params[:password]}))
            sign_in user
            redirect_to root_path, notice: "Signed in!"
        else
            render :new, alert: "Invalid email or password",status: :unprocessable_entity
        end
    end

    def destroy
        sign_out current_user
        redirect_to new_session_path, notice: "You have successfully signed out"
    end
end