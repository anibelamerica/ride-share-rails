class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :cost, presence: true, numericality: { only_integer: true, greater_than: 0}

  def get_drivers
    return Driver.order(:name).map { |driver| driver.name }
  end

  def get_passengers
    return Passenger.order(:name).map { |passenger| passenger.name }
  end

end
