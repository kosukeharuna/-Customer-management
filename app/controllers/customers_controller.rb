class CustomersController < ApplicationController
before_action :set_customer,  only:[:edit,:show,:update,:destroy]
before_action :set_companies, only:[ :new,:edit,:create,:update]
  def index
    @customers = Customer.page(params[:page])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
       redirect_to @customer
    else
      render :new
    end
  end

  def edit
  end

  def update
    if  @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end


  def show
  end

  def destroy
    @customer.destroy
    redirect_to customers_path
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      params.require(:customer).permit(:family_name,:given_name,:email, :company_id)
    end

    def set_companies
      @companies = Company.all
    end
end
