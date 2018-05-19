class UserController < ApplicationController
   
   def index
       
   end
   def login
    # user = User.find_by(user_params)
    # if user and user.authenticate[params[:password]]
    #     session[:user_id] = user_id
    #     redirect_to '/dash'
    # end
   end
   def destroy
    session[:user_id] = nil
    redirect_to '/'
   end
   
    def create
        user = User.new(user_params)
        if user.save
            session[:user_id] = user.id
            flash[:register_errors] = "You are now logged in"
            redirect_to '/'
        else
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/login'
        end
    end
    
    private 
        def user_params
            params.require(:user).permit(:password,:username)
        end
        
end
