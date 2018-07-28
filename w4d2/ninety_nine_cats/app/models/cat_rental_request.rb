# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :integer          not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

STATUS = [
  'PENDING',
  'APPROVED',
  'DENIED'
]

class CatRentalRequest < ApplicationRecord
  validates :cat_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :status, presence: true

  belongs_to :cat,
    class_name: :Cat,
    foreign_key: :cat_id

  def overlapping_requests(start_date, end_date)
    
  end
end
