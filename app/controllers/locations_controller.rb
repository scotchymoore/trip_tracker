class LocationsController < ApplicationController
before_action :set_trip
before_action :set_location, except: [:index, :new, :create]

  def index
    @locations = @trip.locations.all
  end

  def show
    if @location.address == nil
      redirect_to new_location_address_path(@location)
    else
      redirect_to location_address_path(@location)
    end

  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locations.new(location_params)
    if @location.save
      redirect_to trip_location_path(@trip, @location)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip, @location)
    else
      render :edit
    end
  end

  def destroy
    @location.address.destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

private

def location_params
  params.require(:location).permit(:name, :date, :belongs_to)
end

def set_trip
  @trip = Trip.find(params[:trip_id])
end

def set_location
  @location = @trip.locations.find(params[:id])

end


end
