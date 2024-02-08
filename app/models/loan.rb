class Loan < ApplicationRecord
  belongs_to :lend_user, class_name: "User"
  belongs_to :borrow_user, class_name: "User"
  has_many :repayments, dependent: :destroy

  validates :amount, presence: true, length: { maximum: 10 }
  validates :limit_on, presence: true

  WARNING_DAY = 3

  def expired?
    limit_on < Date.today
  end

  def is_warning_days?
   limit_on <= Date.today + WARNING_DAY
  end
 
end
