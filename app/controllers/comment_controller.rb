class CommentController < ApplicationController
    
    def comment
    end
    
    def index
        @items = Item.all
    end
    
    def create  
        
        @new = News.find(params[:new_id])
        comment = @new.comment.create(comment_params, user_id: session[:user_id])
       
    #   comment = Comment.new(comment_params)
    #   check if the user is logged in if not redirect them to login
    #   since a user needs to login before commenting
        if (session[:user_id] !=  nil)
            if comment.save
               session[:comment_id] = comment.id
               flash[:comment_errors] = ['New comment added']
               redirect_to :'/comments'
            else
               flash[:comment_errors] = comment.errors.full_messages
                redirect_to '/home'
            end
        else
            redirect_to '/login'
        end
    end
    
    private 
        def comment_params
            params.require(:comment).permit(:content)
        end
    
end
