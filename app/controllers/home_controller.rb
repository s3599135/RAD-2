class HomeController < ApplicationController
  
  before_action :set_page, only: [:index]

  def index
    @users = User.all
    if (@pageNumber == nil)
      @pageNumber = 1
    end
    @a = 8* @pageNumber
    puts (8*@pageNumber)
    puts(@a)
    @news = Item.where(item_type:'news').order("created_at DESC").limit(8).offset(0 + ((@pageNumber-1)*8))
    
  end
  
  def about
    
  end
  
  def page
    @users = User.all
    @pageNumber = params[:page]
    @pageNumber = @pageNumber.to_i
    @news = Item.where(item_type:'news').order("created_at DESC").limit(8).offset(0 + ((@pageNumber-1)*8))
    render ('index')
  end

  def item
    # the id of news selected from Home
    @id = params['id']
    # get item with the id of the news selected 
    @news = Item.find(@id)
     # get user who submitted news 
    @user = User.find(@news.user_id)
    # all users
    @users = User.all
    # get items in order from latest
    @items = Item.all.order("created_at DESC")
    # comments for that particuler news in descending order
    @comments = Item.where(:item_type => "comment", :news_id => @id).order("created_at DESC")
    # number of comments on that particuler news
    @count = Item.select(:id).where(:news_id => @id).count
    render('item')
  end

  private
    def set_page
      @page = params[:page] || 0
    end
  
end
