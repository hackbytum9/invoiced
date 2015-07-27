require 'test_helper'

class InvoicesControllerTest < ActionController::TestCase

  include Devise::TestHelpers

  setup :initialize_invoice
  
  test "should get index" do
    get :index, customer_id: @customer_one.id
    assert_response :success
    
  end

  test "should create invoices belong to user" do
    assert_difference('Invoice.count')do
      post :create, customer_id: @customer_one.id , invoice:{
                                                                number: "001",
                                                                issue_date: 2015-06-26,
                                                                due_date: 2015-06-26,
                                                                total: 200
      }

    end
    assert_redirected_to customer_invoices_path
    assert_not_nil Invoice.find_by(number: "001")
  end

  test"should new invoice belong to user" do
    get :new, customer_id: @customer_one.id 
    assert_response :success
  end

  test "should delete invoice belong to user" do
    assert_difference('Invoice.count', -1) do
    delete :destroy, customer_id: @customer_one.id, id: @invoice.id
  end
    assert_redirected_to customer_invoices_path

  end

  test "should edit invoice belong to user" do
    get :edit, customer_id: @customer_one.id, id: @invoice.id
    assert_response :success

  end

  test "should update invoice" do 
    patch :update, customer_id: @customer_one.id, id: @invoice.id, invoice:{
                                                                              number: "002",
                                                                              issue_date: 2015-06-26,
                                                                              due_date: 2015-06-26,
                                                                              total: 933


    }
    assert_redirected_to customer_invoice_path, "not going to index page after updated"
  end

  test "should show only invoices belonged to this users" do

    get :show, customer_id: @customer_one.id, id: @invoice.id
    assert_response :success

  end



  private 
    def initialize_invoice
      @invoice    = invoices(:invoice_one)
      @invoice_two  = invoices(:invoice_two)

      @customer_one = customers(:customer_one)
      # @customer_two = customers(:customer_two)

      @user_one = users(:user_one)
      sign_in @user_one
    end

end
