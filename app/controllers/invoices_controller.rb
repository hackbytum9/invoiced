class InvoicesController < ApplicationController

  def index
    @invoices = Invoice.all
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def new
   @invoice = Invoice.new
   3.times { @invoice.line_items.build }
  end
    
  def create
    @invoice = Invoice.new(invoice_params)
    if @invoice.save
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def edit
    @invoice = Invoice.find(params[:id])
  end

  def update
    @invoice = Invoice.find(params[:id])
 
    if @invoice.update(invoice_params)
      redirect_to invoices_path
    else
      render 'new'
    end
  end

  def destroy
    @invoice = Invoice.find(params[:id]) 
    if @invoice.destroy
      redirect_to invoices_path
    end 
  end

    private

    def invoice_params
      params.require(:invoice).permit(:number, :issue_date, :due_date, :total,
        line_items_attributes: [:id, :name, :quantity, :price, :invoice_id, :_destroy])
    end
end
