require 'test_helper'

class CustomersControllerTest < ActionController::TestCase

 include Devise::TestHelpers
  setup :initialize_customer

  test "should go to index customer" do

    get :index 
    assert_response :success
  end

  test "should go to new customer" do

    get :new
    assert_response :success
  end

  test "should go to edit customer" do

    get :edit , id: @customer_one.id
    # get :edit, customer_id: @customer.id, id: @invoice.id
    assert_equal "4455", @customer_one.tel, "address result is not correct"
    assert_response :success,"invoice not found"
  end

  test "should go to delete customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer_one.id
    end

    # delete :destroy ,id: @customer_one.id
    assert_redirected_to customers_path
  end

  test "should go to create customer" do

    post :create , customer: {
                firstname: "nosso",
                lastname: "sss",
                address: "ddss",
                tel: "412321"

    }
   assert_equal "nosso" , Customer.find_by(firstname: "nosso").firstname, "Customer name result is not correct"
    assert_redirected_to customers_path
  end
  
  test "should go to update customer" do

    patch :update,id: @customer_one.id , customer: {
      firstname:"fdsff",
      lastname:"dfsdf",
      address:"dsfsdf",
      tel:"124234234"
    }
    assert_equal "124234234" , Customer.find_by(tel: "124234234").tel, "Customer name result is not correct"
  end

  # test"should show only invoices belonged to this users" do
  #   sign_in @user_one
  # end

  private 
    def initialize_customer
      @user_one = users(:user_one)
      @customer_one = customers(:customer_one)
      sign_in @user_one
    end
end
