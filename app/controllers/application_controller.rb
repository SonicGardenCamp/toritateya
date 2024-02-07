class ApplicationController < ActionController::Base

  before_action :authenticate_user!, except: [:top]

  private
  
  def calcurateApprovalBalance(loan)
    balance = loan.amount
    loan.repayments.each do |repayment|
      if repayment.approval_status == 1
        balance -= repayment.amount
      end
    end
    return balance
  end
  
  def calcurateBalance(loan)
    balance = loan.amount
    loan.repayments.each do |repayment|
        balance -= repayment.amount
    end
    return balance
  end

  def correct_lend_user
    @loan = Loan.find(params[:id])
    unless @loan.lend_user == current_user
      redirect_to lends_path
    end
  end

  def correct_borrow_user
    @loan = Loan.find(params[:id])
    unless @loan.borrow_user == current_user
      redirect_to borrows_path
    end
  end

  def correct_borrow_user_repayment
    @loan = Loan.find(params[:borrow_id])
    unless @loan.borrow_user == current_user
      redirect_to borrows_path
    end
  end
end
