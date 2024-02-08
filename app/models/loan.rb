class Loan < ApplicationRecord
  belongs_to :lend_user, class_name: "User"
  belongs_to :borrow_user, class_name: "User"
  has_many :repayments, dependent: :destroy

  validates :amount, presence: true, length: { maximum: 10 }
  validates :limit_on, presence: true

  def overdue?
    limit_on < Date.today
  end

  def due_within_three_days?
   (limit_on - Date.today).to_i < 3
  end
 
end
