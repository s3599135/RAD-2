class NewsController < ApplicationController
  
  def index
    # @news =  News.new
    if (session[:user_id] == nil)
      redirect_to '/login'
    end
    puts "THIS ID"
    puts session[:user_id]
  end
  
  
  def new
    # @news =  News.new
  end
  
  # create new news object 
  
  def create
    # @news = params[:source] 
    # @news = params[:content] 
    if(session[:user_id] != nil)
      new = News.create(post_params)
      if new.save
        
        redirect_to '/'
      else
        flash[:new_errors] = new.errors.full_messages
        redirect_to '/submit'
      end
    else
      redirect_to '/login'
    end
  end
  
  private
    def post_params
      params.require(:new).permit(:source, :content, :user_id)
    end

end
