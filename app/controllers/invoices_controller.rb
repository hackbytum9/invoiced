class InvoicesController < ApplicationController

  def index
    @customer = customer_id
    @invoices = @customer.invoices.all
  end

  def show
    @customer = customer_id
    @invoice = @customer.invoices.find(params.require(:id))
  end

  def new
   @customer = customer_id
   @invoice = @customer.invoices.new
   3.times { @invoice.line_items.build }
  end
    
  def create
    @customer = customer_id
    @invoice  = @customer.invoices.new(invoice_params)
    if @invoice.save
      redirect_to customer_invoices_path
    else
      render 'new'
    end
  end

  def edit
   @customer = customer_id
  @invoice  = @customer.invoices.find(params[:id])
  end

  def update
    @customer = customer_id
    @invoice = Invoice.find(params[:id])
 
    if @invoice.update(invoice_params)
      redirect_to customer_invoice_path
    else
      render 'new'
    end
  end

  def destroy
    @customer = customer_id
    @invoice = @customer.invoices.find(params.require(:id)) 
    if @invoice.destroy
      redirect_to customer_invoices_path
    end
  end

  def user_params
  params.require(:user).permit(:profile_image)
end

    private

    def invoice_params
      params.require(:invoice).permit(:number, :issue_date, :due_date, :total,
        line_items_attributes: [:id, :name, :quantity, :price, :invoice_id, :_destroy])
    end

    def customer_id
     current_user.customers.where(id: params[:customer_id]).first
    end
end
# @customer.invoices.find(id_invoice)

