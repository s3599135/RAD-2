class CreateNews < ActiveRecord::Migration
 
  def change
    create_table :news do |t|
      t.integer :user_id
      t.text :source
      t.text :content
      t.timestamps null: false
    end
  end
end