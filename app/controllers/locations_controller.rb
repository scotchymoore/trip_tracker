class LocationsController < ApplicationController
before_action :set_trip
before_action :set_location, except: [:index, :new, :create]

  def index
    @locations = @trip.locations.all
  end

  def show
    redirect_to location_address_path(@location)
  end

  def new
    @location = @trip.locations.new
  end

  def create
    @location = @trip.locatons.new(location_params)
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

  def destory
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

private

def location_params
  params.require(:location).permit(:name, :date)
end
def set_trip
    @trip = Trip.find(params[:trip_id])
  end

def set_location
  @location = trips.location.find(params[:id])
end

end
