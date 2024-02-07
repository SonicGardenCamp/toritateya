class RepaymentMailer < ApplicationMailer
    def repayment_email
        @user = params[:user]
        @repayment = params[:repayment]
        mail(to: @user.email, subject: '承認してください')
    end
end
