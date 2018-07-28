# == Schema Information
#
# Table name: albums
#
#  id      :integer          not null, primary key
#  title   :string           not null
#  year    :integer
#  band_id :integer
#  type    :string
#

class Album < ApplicationRecord
  validates :title, presence: true
  validates :album_type, inclusion: { in: %w(live studio),
    message: "Not valid album type! Is it a live or studio album?"}

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id

  has_many :tracks,
    class_name: :Track,
    foreign_key: :album_id
end
