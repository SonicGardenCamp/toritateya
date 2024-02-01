class LendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @lends = current_user.lent_loans
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    Loan.find(params[:id]).destroy
    flash[:success] = "削除しました"
    redirect_to lends_path, status: :see_other
  end
end
