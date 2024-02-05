class RepaymentsController < ApplicationController
  before_action :correct_borrow_user_repayment, only: [:new, :create, :edit, :update]

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

  def edit
    @borrow = Loan.find(params[:borrow_id]) 
    @repayment = @borrow.repayments.find(params[:id])
  end

  def update
    @borrow = Loan.find(params[:borrow_id]) 
    @repayment = @borrow.repayments.find(params[:id])
    @repayment.update(repayment_params)
    redirect_to borrow_path(@borrow)
  end

  def destroy
    @borrow = Loan.find(params[:borrow_id]) 
    @repayment = @borrow.repayments.find(params[:id])
    @repayment.destroy
    redirect_to borrow_path(@borrow)
  end

  private

  def repayment_params
    params.require(:repayment).permit(:amount, :loan_id)
  end
end
