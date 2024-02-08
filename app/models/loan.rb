class Loan < ApplicationRecord
  extend Enumerize
  belongs_to :lend_user, class_name: "User"
  belongs_to :borrow_user, class_name: "User"
  has_many :repayments, dependent: :destroy

  validates :amount, presence: true, length: { maximum: 10 }, numericality: { only_integer: true }
  validates :limit_on, presence: true
  enumerize :approval_status, in: [0,1], default: 0

  WARNING_DAY = 3

  

  def expired?
    limit_on < Date.today
  end

  def is_warning_days?
   limit_on <= Date.today + WARNING_DAY
  end
 
end
