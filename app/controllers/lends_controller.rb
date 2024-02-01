class LendsController < ApplicationController
  def index
  end

  def new
    @loan = Loan.new
    @users = User.all
  end

  def create
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
