class Visit < ApplicationRecord
  validates :user_id, :shortened_urls_id, presence: true

  belongs_to(
    :visitor,
    :class_name => "User",
    :foreign_key => :user_id,
    :primary_key => :id
  )

  belongs_to(
   :visited_url,
   :class_name => "ShortenedUrl",
   :foreign_key => :shortened_urls_id,
   :primary_key => :id
  )

  def self.record_visit!(user,shortened_url)
    Visit.create(
      :user_id => user.id,
      :shortened_urls_id => shortened_url.id
    )
  end

end
