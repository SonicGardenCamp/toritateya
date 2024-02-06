class LendsController < ApplicationController
  before_action :correct_lend_user, only: [:show, :edit, :update]
  
  def index
    lends = current_user.lent_loans
    @lendInfos = []
    if lends.any?
      lends.each do |lend|
        @lendInfos.push({"lend" => lend,"balance" => calcurateBalance(lend)})
      end
    end
  end

  def new
    @loan = Loan.new
  end

  def create
    user = User.find_by(email: params[:loan][:email])
    if user 
      logger.debug("if文の中に入りました")
      @loan = Loan.new(lend_user: current_user, borrow_user: user, amount: params[:loan][:amount], comment: params[:loan][:comment], return_on: params[:loan][:return_on])
      logger.debug(@loan.inspect)
      if @loan.save
        logger.debug("保存処理実行")
        logger.debug(@loan.inspect)
        LendUserMailer.with(user: user, loan: @loan).lend_user_email.deliver_later
        redirect_to lends_path
      else
        render 'new', status: :unprocessable_entity
      end
    else
      logger.debug("else文の中に入りました")
      render 'new', status: :unprocessable_entity
    end
  end
  
  def show
    @lend = current_user.lent_loans.find(params[:id])
    @repayments = @lend.repayments.order(created_at: :asc)
    @repaymentBalance = calcurateBalance(@lend)
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def approval
    @loan = Loan.find(params[:id])
    if @loan.update(approval_status: 1)
      logger.debug("if文の中に入りました")
      flash[:success] = "承認しました"
      redirect_to root_path

    end
  end

  def destroy
    Loan.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to lends_path, status: :see_other
  end
end
