class RepaymentMailer < ApplicationMailer
    def repayment_email
        @borrow = params[:borrow]
        @repayment = params[:repayment]
        @repaymentBalance = params[:repaymentBalance]
        mail(to: @borrow.lend_user.email, subject: '承認してください')
    end
end
