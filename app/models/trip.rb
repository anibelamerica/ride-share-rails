class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  def get_drivers
    return Driver.order(:name).map { |driver| driver.name }
  end

  def get_passengers
    return Passenger.order(:name).map { |passenger| passenger.name }
  end

end
