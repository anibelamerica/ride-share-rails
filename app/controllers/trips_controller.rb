class TripsController < ApplicationController

  def show
    @trip = Trip.find_by(id: params[:id])
    if @trip.nil?
      head :not_found
    end
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      redirect_to trips_path
    else
      render :new, status: :bad_request
    end
  end

  def update
    trip = Trip.find(params[:id])

    if trip.update(trip_params)
      redirect_to trip_path(trip.id)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    trip = Trip.find_by(id: params[:id])

    if trip.destroy
      redirect_to trips_path
    else
      render :index, status: :bad_request
    end
  end

  private

  def trip_params
    return params.require(:trip).permit(
      :rating
    )
  end


end
