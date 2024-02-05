class ApplicationController < ActionController::Base
    
    def calcurateBalance(loan)
     balance = loan.amount
     loan.repayments.each do |repayment|
       balance -= repayment.amount
     end
     return balance
    end
end
