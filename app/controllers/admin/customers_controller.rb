class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  #会員一覧
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

end
