require 'securerandom'
class Shortened_Url < ApplicationRecord
  include SecureRandom
  validates :short_url, uniqueness:true

  def self.random_code
    random_code = SecureRandom.urlsafe_base64(16)
    while self.exists?(short_url: random_code)
      random_code = SecureRandom.urlsafe_base64(16)
    end
    random_code
  end

  def self.make_short_url(user,long_url)
    Shortened_Url.create!(:long_url =>long_url , :short_url=> Shortened_Url.random_code,:user_id =>user.id)
  end

  belongs_to :submitter,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visitors,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :shortened_urls_id


  def num_clicks
    p id = self.id
    p sql = "SELECT COUNT(DISTINCT user_id) FROM visits WHERE visits.shortened_urls_id = #{id}"
    records_array = ActiveRecord::Base.connection.execute(sql)

  end

  def num_uniques

  end

  def num_recent_uniques

  end
end
