class CustomersController < ApplicationController

  def index
    @customers = current_user.customers.all
  end

   def new
    @customer  =  current_user.customers.build
  end

   def edit
    @customer = Customer.find(params[:id])
  end

   def update
    @customer = @customer = Customer.find(params[:id])
      if @customer.update_attributes(customer_params)
        redirect_to customers_path
      else
        render 'edit'
      end
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end

  def create
    @customer = current_user.customers.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render 'new'
    end
  end

  private 
    def customer_params
      params.require(:customer).permit(:firstname,:lastname,:address,:tel,:user_id)
    end

end
