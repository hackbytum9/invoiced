require 'test_helper'

class InvoiceTest < ActiveSupport::TestCase
  setup :initialize_invoice

  # test "should not save invoice" do
  #   invoice = Invoice.new
  #   assert invoice.save, "Save invoice"

  # end

  test "should plus invoice number" do
    new_invoice = Invoice.new
    assert_equal "003", new_invoice.number
  end

  # test "calculate_total" do
  #   @invoice.calculate_total
  #   assert_equal(200, @invoice.calculate_total) 
  # end

  # test "should summation invoice" do

  #   assert_equal 200, @invoice_one.total

  # end

  test "should calculate invoice" do
    @invoice_one.calculate_total
    # sum = @lineitem_one.quantity.to_i * @lineitem_one.price.to_i
    assert_equal 200,@invoice_one.total

  end


    def initialize_invoice
      @invoice_one   = invoices(:invoice_one)
      @invoice_two   = invoices(:invoice_two)

      @lineitem_one   = line_items(:lineitem_one)
    end


end
