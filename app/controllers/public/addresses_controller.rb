class Public::AddressesController < ApplicationController

before_action :authenticate_public!


   def index
    @public = Public.find(current_public.id)
    @addresses = @public.address
    @address = Address.new
    @addresses = Address.all
   end

   def create
     @address = Address.new(address_params)
     @address.public_id = current_public.id
    if @address.save
      redirect_to public_addresses_path
    else
      render 'index'
    end
   end

   def edit
    @address = Address.find_by_id(params[:id])
   end

   def update
     @address = Address.find_by_id(params[:id])
     if @address.update(address_params)
       redirect_to public_addresses_path
     else
       render :edit
     end
   end

   def destroy
     @address = Address.find_by_id(params[:id])
     @address.destroy
     redirect_to public_addresses_path
   end

   private

   def address_params
     params.require(:address).permit(
       :name,
       :postal_code,
       :address
       )
   end

end