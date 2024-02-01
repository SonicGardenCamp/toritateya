class Loan < ApplicationRecord
  belongs_to :lend_user, class_name: "User"
  belongs_to :borrow_user, class_name: "User"
  has_many :repayments, dependent: :destroy
end
