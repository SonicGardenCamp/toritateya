class BorrowsController < ApplicationController
  before_action :authenticate_user!
  def index
    @borrows = current_user.borrowed_loans
  end

  def new
  end

  def create
  end

  def show
    @borrow = current_user.borrowed_loans.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
