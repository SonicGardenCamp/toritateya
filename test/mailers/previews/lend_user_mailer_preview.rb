# Preview all emails at http://localhost:3000/rails/mailers/lend_user_mailer
class LendUserMailerPreview < ActionMailer::Preview
    def lend_user_email
        user = User.find(2)
        LendUserMailer.with(user: user, loan: 3).lend_user_email
    end
end
