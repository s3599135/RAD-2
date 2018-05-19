module Api
  module V0
    class ItemController < ApplicationController
      def index 
        @items = Item.order('created_at DESC')
        @id = params[:id]
        puts @id
        @item = @items.find_by_id (@id)

        respond_to do |format|
          format.json { render json: @item }
        end
        # render json: {status: 'SUCCESS', message: 'Items loaded', data:items}, status: ok
      end
      
      # Add new item (news)
      def update
        # @by     = params[:username]
        # @text   = params[:text]
        # @type   = params[:type]
        # @source = params[:'new source']
        new = News.new(post_params)
        if new.save
          session[:new_id] = new.id
          redirect_to '/'
        else
          flash[:new_errors] = new.errors.full_messages
          redirect_to '/submit'
        end
        
      end
      
      
      # show the selected item id
      def show
        @items = Item.order('created_at DESC')
        @id = params[:id]
        puts @id
        @item = @items.find_by_id (@id)
        
        
        # Naming varible 
        @by     = @item["user_id"]
        @itemId = @item["id"]
        @time   = @item["created_at"].to_time.to_i
        @type   = @item["item_type"]
        if (@type === "news")
          @title  = @item["content"]
          @url    = @item["source"]
          @json = { :by => @by, :id => @itemId, :time => @time, :type => @type, :title => @title, :url => @url }.to_json
          
          respond_to do |format|
            format.json { render json: @json }
          end
        else
          @text   = @item["content"]
          @json = { :by => @by, :id => @itemId, :time => @time, :type => @type, :text => @text }.to_json
          respond_to do |format|
            format.json { render json: @json }
          end
        end

      end
    end
  end
end