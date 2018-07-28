# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
COLOR = ['red',
        'orange',
        'yellow',
        'white',
        'black',
        'brown',
        'grey'
      ]
class Cat < ApplicationRecord
  validates :birth_date, presence: true
  validates :color, presence: true
  validates :name, presence: true
  validates :sex, presence: true

  has_many :cat_requests, dependent: :destroy,
    class_name: :CatRentalRequest,
    foreign_key: :cat_id
end
