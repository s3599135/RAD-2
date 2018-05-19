class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|

      t.integer :user_id
      t.text :item_type
      t.text :content
      t.text :source
      t.integer :news_id
      t.timestamps null: false
    end
  end
end
