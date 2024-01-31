User.create!(email: "user1@gmail.com",
             password: "password")
User.create!(email: "user2@gmail.com",
             password: "password")
             
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 500, return_on: Date.today)
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 600, return_on: Date.today)
Loan.create!(lend_user_id: 1, borrow_user_id: 2, amount: 1000, return_on: Date.today)

