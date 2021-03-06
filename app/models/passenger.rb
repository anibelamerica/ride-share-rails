class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :phone_num, presence: true
  validates :name, uniqueness: {scope: :phone_num, :message => "and phone number combination already exists in database."}

  has_many :trips, dependent: :destroy

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
