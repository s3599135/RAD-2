class Comment < ActiveRecord::Base
    belongs_to :user
    belongs_to :news
    
    validates :content, :presence => true
    validates :content, format: { with: /\A(?=.*\d)(?=.*([a-z]))(?=.*([A-Z]))([\x20-\x7E]){3,1000}\z/, message: "Comment must be at least 3 characters and less than 1000 characters" }
    validates :content, :length => {:minimum => 3}
    validates :content, :length => {:maximum => 1000}
end