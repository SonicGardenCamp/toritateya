class RepaymentMailer < ApplicationMailer
    def repayment_email
        @user = params[:user]
        @borrow = params[:borrow]
        @repayment = params[:repayment]
        @repaymentBalance = params[:repaymentBalance]
        mail(to: @user.email, subject: '承認してください')
    end
end
