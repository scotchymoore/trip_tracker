class AddressesController < ApplicationController
  before_action :set_location
  before_action :set_address, except: [:index, :new, :create]

  def index
    @addresses = @location.addresses.all
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
    @address = @location.addresses.new(address_params)
    if @address.save
      redirect_to @address, notice: 'Location Address Created!'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address = address.update(address_params)
      redirect_to @addresses
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

def set_location
  @location = Location.find(params[:location_id])
end
#before action
def set_address
  @address = @location.addresses.find(params[:id])
end
end
