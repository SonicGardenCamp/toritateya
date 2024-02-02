user1 = User.create!(name: "user1",email: "user1@gmail.com",
             password: "password")
user2 = User.create!(name: "user2", email: "user2@gmail.com",
             password: "password")
             
loan1 = Loan.create!(lend_user_id: user1.id, borrow_user_id: user2.id, amount: 500, return_on: Date.today)
loan2 = Loan.create!(lend_user_id: user1.id, borrow_user_id: user2.id, amount: 600, return_on: Date.today)
loan3 = Loan.create!(lend_user_id: user1.id, borrow_user_id: user2.id, amount: 1000, return_on: Date.today)

Repayment.create!(loan_id: loan1.id, amount: 200 )
Repayment.create!(loan_id: loan1.id, amount: 300 )
Repayment.create!(loan_id: loan2.id, amount: 200 )
Repayment.create!(loan_id: loan2.id, amount: 300 )