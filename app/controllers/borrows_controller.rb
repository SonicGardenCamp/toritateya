class BorrowsController < ApplicationController
  before_action :authenticate_user!
  def index
    borrows = current_user.borrowed_loans
    @borrowInfos = []
    if borrows.any?
      borrows.each do |borrow|
        @borrowInfos.push({"borrow" =>borrow,"balance" =>calcurateBalance(borrow)})
      end
    end
  end

  def new
  end

  def create
  end

  def show
    @borrow = current_user.borrowed_loans.find(params[:id])
    @repayments = @borrow.repayments.order(created_at: :asc)
    @repaymentBalance = calcurateBalance(@borrow)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
