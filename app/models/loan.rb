class Loan < ApplicationRecord
  belongs_to :lend_user, class_name: "User"
  belongs_to :borrow_user, class_name: "User"
  has_many :repayments, dependent: :destroy

  validates :amount, presence: true, length: { maximum: 7 }
  validates :return_on, presence: true

  def overdue?
    return_on < Date.today
  end
end
