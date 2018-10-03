class DriversController < ApplicationController

  def index
    @drivers = Driver.all
  end

  def show
    @driver = Driver.find_by(id: params[:id])
    if @driver.nil?
      head :not_found
    end
  end

  def new
    @driver = Driver.new
  end

  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @driver = Driver.find_by(id: params[:id])
  end

  def update
    driver = Driver.find(params[:id])

    if driver.update(driver_params)
      redirect_to driver_path(driver.id)
    else
      render :edit, status: :bad_request
    end
  end

  private

  def driver_params
    return params.require(:driver).permit(
      :name,
      :vin
    )
  end


end
