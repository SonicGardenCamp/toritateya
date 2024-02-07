class RepaymentsController < ApplicationController
  before_action :correct_borrow_user_repayment, only: [:new, :create, :edit, :update]

  def new
    @borrow = Loan.find(params[:borrow_id])
    @repayment = Repayment.new
    @repaymentBalance = calcurateBalance(@borrow)
  end

  def create
    @borrow = Loan.find(params[:borrow_id])
    user = User.find(@borrow.lend_user.id)
    @repaymentBalance = calcurateBalance(@borrow)
    @repayment = @borrow.repayments.new(repayment_params)
    if @repaymentBalance < repayment_params[:amount].to_i
      flash.now[:error] = '返却額が返却残高を超えています'
      logger.debug(flash[:error])
       render :new, status: :unprocessable_entity
    elsif @repayment.save
      RepaymentMailer.with(user: user, borrow: @borrow, repayment: @repayment, repaymentBalance: @repaymentBalance).repayment_email.deliver_later
      redirect_to borrow_path(@borrow), notice: '返済を申請しました。'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @borrow = Loan.find(params[:borrow_id])
    @repayment = @borrow.repayments.find(params[:id])
    @repaymentBalance = calcurateBalance(@borrow)
  end

  def update
    @borrow = Loan.find(params[:borrow_id])
    @repayment = @borrow.repayments.find(params[:id])
    @repaymentBalance = calcurateBalance(@borrow) + @repayment.amount
    if @repaymentBalance < repayment_params[:amount].to_i
      flash.now[:error] = '返却額が返却残高を超えています'
      logger.debug(flash[:error])
       render :edit, status: :unprocessable_entity
    elsif  @repayment.update(repayment_params)
      redirect_to borrow_path(@borrow), notice: '返済履歴の編集に成功しました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @borrow = Loan.find(params[:borrow_id]) 
    @repayment = @borrow.repayments.find(params[:id])
    @repayment.destroy
    redirect_to borrow_path(@borrow)
  end

  def approval
    @repayment = Repayment.find(params[:id])
    if @repayment.update(approval_status: 1)
      logger.debug("if文の中に入りました")
      flash[:success] = "承認しました"
      redirect_to root_path
    end
  end

  private

  def repayment_params
    params.require(:repayment).permit(:amount, :loan_id)
  end
end
