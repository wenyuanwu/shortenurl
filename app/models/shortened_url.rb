

class ShortenedUrl < ApplicationRecord
  validates :long_url,:short_url,:user_id, presence: true
  validates :short_url, uniqueness: true

  belongs_to(
  :submitter,
  :class_name => "User",
  :foreign_key => :user_id,
  :primary_key => :id
  )

  has_many(
  :visits,
  :class_name => "Visit",
  :foreign_key => :shortened_urls_id,
  :primary_key => :id
  )

  has_many :visitors, :through => :visits, :source => :visitor

  def num_clicks
    visits.count
  end

  def num_uniques
    visits.select(:user_id).distinct.count
  end

  def num_recent_uniques
    visits.select(:user_id).where("created_at > ?", 10.seconds.ago).distinct.count
  end

  def self.create_for_user_and_long_url!(user, long_url)
    ShortenedUrl.create(
    :long_url => long_url,
    :user_id => user.id,
    :short_url => ShortenedUrl.random_code
    )
  end

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(:short_url => random_code)
    end
  end

end
