class Driver < ApplicationRecord
  validates :name, presence: true
  validates :vin, presence: true

  has_many :trips

  def total_earnings
    return self.trips.sum { |trip| (trip.cost - 1.65) * 0.80 / 100}.round(2)
  end


end
