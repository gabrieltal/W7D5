class User < ApplicationRecord
  validates :email, uniqueness:true

  has_many :submitted_urls,
    class_name: :Shortened_Url,
    primary_key: :id,
    foreign_key: :user_id

  has_many :visited_urls,
    class_name: :Visit,
    primary_key: :id,
    foreign_key: :user_id


end
