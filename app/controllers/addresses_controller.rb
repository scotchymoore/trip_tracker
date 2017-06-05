class AddressesController < ApplicationController
  before_action :set_location
  
  before_action :set_trip
  before_action :set_address, except: [:index, :new, :create]

  def index
    @addresses = @location.addresses.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    @address.location_id = params[:location_id]
    if @address.save
      redirect_to location_address_path(@location, @address), notice: 'Location Address Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to location_address_path(@location)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    flash[:notice]= 'Location Address Deleted!'
    redirect_to addresses_path
  end


  private
  #strong params
  def address_params
    params.require(:address).permit(:location_address, :description)
  end

 def set_trip
   @trip = @location.trip_id 
  end
  
  def set_location
    @location = Location.find(params[:location_id])
  end
  #before action
  def set_address
    @address = @location.address
  end
end
