User.create!(name: "user1",email: "user1@gmail.com",
             password: "password")
User.create!(name: "user2", email: "user2@gmail.com",
             password: "password")
             
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 500, return_on: Date.today)
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 600, return_on: Date.today)
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 1000, return_on: Date.today)

Repayment.create!(loan_id: 1, amount: 200 )
Repayment.create!(loan_id: 1, amount: 300 )
Repayment.create!(loan_id: 2, amount: 200 )
Repayment.create!(loan_id: 2, amount: 300 )