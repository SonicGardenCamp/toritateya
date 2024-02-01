class RepaymentsController < ApplicationController
  def new
    @borrow = Loan.find(params[:borrow_id])
    @repayment = Repayment.new
  end

  def create
    @borrow = Loan.find(params[:borrow_id]) 
    @repayment = @borrow.repayments.new(repayment_params)
    if @repayment.save
      redirect_to borrow_path(@borrow), notice: '返済が成功しました。'
    else
      render :new
    end
  end


  private

  def repayment_params
    params.require(:repayment).permit(:amount, :loan_id)
  end


end

