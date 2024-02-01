class LendsController < ApplicationController
  def index
  end

  def new
    @loan = Loan.new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user
      logger.debug("if文の中に入りました")
      @loan = Loan.new(lend_user: , borrow_user: , amount: , comment: ,return_on: )
    else
      logger.debug("else文の中に入りました")
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
