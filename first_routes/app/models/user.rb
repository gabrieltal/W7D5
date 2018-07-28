class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :titles,
    foreign_key: :artist_id,
    class_name: :Artwork,
    dependent: :destroy

  has_many :artwork_shares,
    foreign_key: :artwork_id,
    class_name: :ArtworkShare,
    dependent: :destroy

end
