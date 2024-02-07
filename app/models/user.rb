class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :lent_loans, class_name: 'Loan', foreign_key: 'lend_user_id'
  has_many :borrowed_loans, class_name: 'Loan', foreign_key: 'borrow_user_id'
end
