class LendUserMailer < ApplicationMailer
    def lend_user_email
        @user = params[:user]
        @loan = params[:loan]
        mail(to: @user.email, subject: '借りたことを承認してください')
    end
end
