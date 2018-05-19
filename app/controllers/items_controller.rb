class ItemsController < ApplicationController
    
    def index
        # @items = Item.all
        # @users = User.all
        # if (@pageNumber == nil)
        #   @pageNumber = 1
        # end
        # @a = 8* @pageNumber
        # puts (8*@pageNumber)
        # puts(@a)
        # @news = Item.where(item_type:'news').order("created_at DESC").limit(8).offset(0 + ((@pageNumber-1)*8))
        
        # # @comments = Item.find_all_by_news_id(:item.id)
    end
    
    def page
    @users = User.all
    @pageNumber = params[:page]
    @pageNumber = @pageNumber.to_i
    @news = Item.where(item_type:'news').order("created_at DESC").limit(8).offset(0 + ((@pageNumber-1)*8))
    render ('index')
    end

    
    def create
        @users = User.all
        item = Item.new(item_params)
        if item.save
            session[:item_id] = item.id
            puts (item.item_type)
            if(item.item_type == "news")
               redirect_to "/" 
            
            else
                flash[:comment_errors] = ['New comment added']
                redirect_to "/comments"
            end
        else
            flash[:item_errors] = item.errors.full_messages
            puts (item.errors.full_messages)
            redirect_to :back
        end
    end
    
      
    def feed
        @users = User.all
        @id = params['id']
        @news = News.all
        @comments = Comment.all
        @items = Item.all
        render('item')
    end
    
     private 
        def item_params
            params.require(:item).permit(:content, :source, :item_type, :news_id, :user_id)
        end

end
