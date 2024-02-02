class LendsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    lends = current_user.lent_loans
    @lendInfos = []
    if lends.any?
      lends.each do |lend|
        @lendInfos.push({"lend" =>lend,"balance" =>calcurateBalance(lend)})
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
        redirect_to lends_path
      else
        render 'new', status: :unprocessable_entity
      end
    else
      logger.debug("else文の中に入りました")
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @loan = Loan.find(params[:id])
  end

  def update
    @loan = Loan.find(params[:id])
    if @loan.update(amount: params[:loan][:amount], comment: params[:loan][:comment], return_on: params[:loan][:return_on])
      logger.debug("if文の中に入りました")
      redirect_to lends_path
    else
      logger.debug("else文の中に入りました")
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    Loan.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to lends_path, status: :see_other
  end
end