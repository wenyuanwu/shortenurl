class Tagging < ApplicationRecord
  validates :url_id, :topic_id, presence: true
  
end
