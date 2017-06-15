class CreateTagTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :tag_topics do |t|
      t.integer :url_id, null: false
      t.string :topic, null:false
      
      t.timestamps
    end
  end
end
