class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true
  has_many :trips, dependent: :nullify

  def amt_charged
    return self.trips.sum { |trip| trip.cost } * 1.0 / 100
  end

  def all_trips_rated
    return self.trips.select { |trip| trip.rating == nil }.any?
  end

  def self.search(search)
    where("name ILIKE ?", "%#{search}%")
  end

end
