# == Schema Information
#
# Table name: tracks
#
#  id       :integer          not null, primary key
#  title    :string           not null
#  lyrics   :text
#  ord      :integer
#  album_id :integer
#  type     :string
#  band_id  :integer
#

class Track < ApplicationRecord
  belongs_to :album,
    class_name: :Album,
    foreign_key: :album_id

  belongs_to :band,
    class_name: :Band,
    foreign_key: :band_id
end
