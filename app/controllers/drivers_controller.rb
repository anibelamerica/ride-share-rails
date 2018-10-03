class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def new
    @driver = Driver.new
  end

  private

  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end


end
