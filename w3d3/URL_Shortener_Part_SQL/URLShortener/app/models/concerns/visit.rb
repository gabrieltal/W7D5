class Visit < ApplicationRecord
  def self.record_visit!(user,shortened_url)
    Visit.create(user_id: user.id,shortened_urls_id:shortened_url.id)
  end

  belongs_to :user,
    class_name: :User,
    primary_key: :id,
    foreign_key: :user_id

  belongs_to :shortened_url,
    class_name: :Shortened_Url,
    primary_key: :id,
    foreign_key: :shortened_urls_id

end
