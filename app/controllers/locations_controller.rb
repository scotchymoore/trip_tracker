class LocationsController < ApplicationController
before_action: set_location, except[:index, :new, :create, :update)

  def index
    @locations = trip.locations
  end

  def show
  end

  def new
    @location = trip.locations.new
  end

  def create
    @location = trip.locatons.new(location_params)
      if @location.save
        redirect_to locations_path
      else 
        render :new
      end
  end

  def edit
  end

  def update
    if trip.location.save
      redirect_to locations_path
    else
      render :edit
    end
  end

  def destory
    @location.destroy
    redirect_to locations_path
  end

private

def location_params
  params.require(:location).permit(:name, :date)
end

def set_location
  @location = trips.location.find(params[:id])
end

end
