class TagTopic < ApplicationRecord
  validates :url_id, :topic, :presence => true

  has_many(
  :taggings,
  :class_name => "Tagging",
  :foreign_key => :topic_id,
  :primary_key => id
  )

  
end
