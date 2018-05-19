  module V0
    class ItemController < ApplicationController
      protect_from_forgery with: :null_session
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
      def create
        @by     = params[:username]
        @text   = params[:text]
        @type   = params[:type]
        @source = params[:'new source']
        @boolean = 0
        User.all.each do |user|
          # puts("tes21213213t"+user[:username])
          # puts("lol" +@by)
          if ( user[:username] === @by)
            @target = user[:id]
            new = Item.new(user_id: @target, item_type: @type, content: @text, source: @source)
            if new.save
              @boolean = 1
            end
          end
        end
        if (@boolean === 1)
          render status: 200, json: {
            message: "Successfully created "+@type +"."
          }.to_json
        else
          render status: 400, json: {
            message: "Submission failed."
          }.to_json
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
