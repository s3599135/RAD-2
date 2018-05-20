class Item < ActiveRecord::Base
    
  belongs_to :user
  
  validates :content,
    presence: true,
    length: { minimum: 5, maximum: 1000 },
    if: ->{ item_type === 'comments' }
        
  validates :content,
    presence: true,
    length: { minimum: 10, maximum: 200 },
    if: ->{ item_type === 'news' }
        
  validates :source,
    presence: false
    
  validates :source, 
    format: { with: URI.regexp }, if: Proc.new { |a| a.source.present? }
    
  
end
