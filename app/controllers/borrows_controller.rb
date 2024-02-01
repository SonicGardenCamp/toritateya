class BorrowsController < ApplicationController
  before_action :authenticate_user!
  def index
    @borrows = current_user.borrowed_loans
  end

  def new
    @borrow = Loan.new
  end

  def create
    borrow = current_user.borrowed_loans.new(loan_params)
  end

  def show
    @borrow = Loan.find(params[:id])
    @repayments = @borrow.repayments
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def loan_params
  params.require(:loan).permit(:lend_user_id, :amount, :return_on, :comment)
  end
end
