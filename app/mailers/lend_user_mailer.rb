class LendUserMailer < ApplicationMailer
    def lend_user_email
        @loan = params[:loan]
        mail(to: @loan.borrow_user.email, subject: '借りたことを承認してください')
    end
end
