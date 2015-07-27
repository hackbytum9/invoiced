class InvoicesController < ApplicationController
  before_action :check_customer!

  def index
    @invoices = @customer.invoices
  end

  def show
    @invoice = @customer.invoices.find(params[:id])
  end

  def new
   @invoice = @customer.invoices.new
   3.times { @invoice.line_items.build }
  end
    
  def create
    @invoice  = @customer.invoices.new(invoice_params)
    if @invoice.save
      redirect_to customer_invoices_path
    else
      render 'new'
    end
  end

  def edit
    @invoice  = @customer.invoices.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
 
    if @invoice.update(invoice_params)
      redirect_to customer_invoice_path
    else
      render 'new'
    end
  end

  def destroy
    @invoice = @customer.invoices.find(params[:id]) 
    if @invoice.destroy
      redirect_to customer_invoices_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:profile_image)
  end

  def invoice_params
    params.require(:invoice).permit(:number, :issue_date, :due_date, :total,
      line_items_attributes: [:id, :name, :quantity, :price, :invoice_id, :_destroy])
  end

  def find_customer
    current_user.customers.where(id: params[:customer_id]).first
  end

  def check_customer!
    unless @customer = find_customer
      redirect_to root_path
    end
  end
end



