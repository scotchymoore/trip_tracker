class AddressesController < ApplicationController
  before_action :set_car, except: [:index, :new, :create]

  def index
    @addresses = current_user.adresses
  end

  def show
  end

  def new
    @address = current_user.address.new
  end

  def create
    @address = current_user.addresses.new(address_params)
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

#before action
def set_address
  @address = current_user.addresses.find(params[:id])
end
end
