class LendsController < ApplicationController
  before_action :correct_lend_user, only: [:show, :edit, :update]
  
  def index
    lends = current_user.lent_loans
    @lendInfos = []
    if lends.any?
      lends.each do |lend|
        @lendInfos.push({"lend" => lend,"balance" => calcurateApprovalBalance(lend)})
      end
    end
  end

  def new
    @loan = current_user.lent_loans.build
  end

  def create
    borrow_user = User.find_by(email: params[:loan][:email])
    if borrow_user
      @loan = current_user.lent_loans.build(loan_params)
      @loan.borrow_user_id = borrow_user.id
      if @loan.save
        LendUserMailer.with(loan: @loan).lend_user_email.deliver_later
        redirect_to lends_path
      else
        render 'new', status: :unprocessable_entity
      end
    else
      flash.now[:error] = 'ユーザーがいません'
      render 'new', status: :unprocessable_entity
    end
  end
  
  def show
    @lend = current_user.lent_loans.find(params[:id])
    @repayments = @lend.repayments.order(created_at: :asc)
    @repaymentApprovalBalance = calcurateApprovalBalance(@lend)
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def approval
    @loan = Loan.find(params[:id])
    if @loan.update(approval_status: 1)
      flash[:success] = "承認しました"
      redirect_to root_path

    end
  end

  def destroy
    Loan.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to lends_path, status: :see_other
  end

  private 
  
  def loan_params
    params.require(:loan).permit(:amount, :comment, :limit_on)
  end
end
