shuya = User.create!(name: "しゅうや",email: "tomas.s101515@gmail.com",
             password: "password")
ryo = User.create!(name: "りょう", email: "lipper.corp@gmail.com",
             password: "password")
maeko = User.create!(name: "まえこう", email: "qiantianxingda@gmail.com",
             password: "password")
             
loan1 = Loan.create!(lend_user_id: ryo.id, borrow_user_id: maeko.id, amount: 5000, return_on: Date.today, comment:"競馬" ,approval_status:0)
loan2 = Loan.create!(lend_user_id: ryo.id, borrow_user_id: maeko.id, amount: 5000, return_on: Date.today, comment:"パチンコ" ,approval_status:1)
loan3 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: ryo.id, amount: 5000, return_on: Date.today, comment:"競馬" ,approval_status:0)
loan4 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: ryo.id, amount: 5000, return_on: Date.today, comment:"パチンコ" ,approval_status:1)

loan5 = Loan.create!(lend_user_id: shuya.id, borrow_user_id: maeko.id, amount: 5000, return_on: Date.today, comment:"競馬" ,approval_status:0)
loan6 = Loan.create!(lend_user_id: shuya.id, borrow_user_id: maeko.id, amount: 5000, return_on: Date.today, comment:"パチンコ" ,approval_status:1)
loan7 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: shuya.id, amount: 5000, return_on: Date.today, comment:"競馬" ,approval_status:0)
loan8 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: shuya.id, amount: 5000, return_on: Date.today, comment:"パチンコ" ,approval_status:1)
loan9 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: shuya.id, amount: 5000, return_on: Date.today.days_since(2), comment:"パチンコ" ,approval_status:1)
loan10 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: shuya.id, amount: 5000, return_on: Date.today.days_since(4), comment:"パチンコ" ,approval_status:1)
loan11 = Loan.create!(lend_user_id: maeko.id, borrow_user_id: shuya.id, amount: 5000, return_on: Date.today.days_ago(2), comment:"パチンコ" ,approval_status:1)


Repayment.create!(loan_id: loan2.id, amount: 200,approval_status:0 )
Repayment.create!(loan_id: loan2.id, amount: 300,approval_status:1 )
Repayment.create!(loan_id: loan4.id, amount: 200,approval_status:0 )
Repayment.create!(loan_id: loan4.id, amount: 300,approval_status:1 )
Repayment.create!(loan_id: loan6.id, amount: 200,approval_status:0 )
Repayment.create!(loan_id: loan6.id, amount: 300,approval_status:1 )
Repayment.create!(loan_id: loan8.id, amount: 200,approval_status:0 )
Repayment.create!(loan_id: loan8.id, amount: 300,approval_status:1 )