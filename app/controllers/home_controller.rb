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
  
  def page
    @users = User.all
    @pageNumber = params[:page]
    @pageNumber = @pageNumber.to_i
    @news = Item.where(item_type:'news').order("created_at DESC").limit(8).offset(0 + ((@pageNumber-1)*8))
    render ('index')
  end

  
  def item
    @users = User.all
    @id = params['id']
    @news = News.all
    @comments = Comment.all
    render('comment')
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
    def set_page
      @page = params[:page] || 0
    end
  
end
