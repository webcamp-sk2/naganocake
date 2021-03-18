class Admin::CustomersController < ApplicationController

  before_action :authenticate_admin!

  #会員一覧
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

　def show
　  @customer = Customer.find(params[:id])
　end

　def edit
　  @customer = Customer.find(params[:id])
　end

　def destroy
　  @customer = Customer.find(params[:id])
　  @customer.destroy
　end

　def update
　end

end
