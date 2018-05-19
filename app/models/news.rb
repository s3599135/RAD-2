class News < ActiveRecord::Base
 require 'uri'
 belongs_to :user
 has_many :comment

 validates :content, :presence => true
 validates :content, format: { with: /\A(?=.*\d)(?=.*([a-z]))(?=.*([A-Z]))([\x20-\x7E]){10,200}\z/, message: "Title must contain a minimum of 10 characters and a maximum of 200 characters" }
 validates :source , format: { with: URI.regexp, message: "You must submit a valid url" }

end
