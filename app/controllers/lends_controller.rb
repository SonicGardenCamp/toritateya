class LendsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def new
    @loan = Loan.new
  end

  def create
    user = User.find_by(email: params[:loan][:email])
    if user
      logger.debug("if文の中に入りました")
      @loan = Loan.new(lend_user: current_user, borrow_user: user, amount: params[:loan][:amount], comment: params[:loan][:comment], return_on: params[:loan][:return_on])
      logger.debug(@loan.lend_user_id)
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
