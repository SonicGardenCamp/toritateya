class Repayment < ApplicationRecord
  extend Enumerize
  belongs_to :loan
  validates :amount, presence: true, length: { maximum: 10 }, numericality: { only_integer: true }
  enumerize :approval_status, in: [0,1], default: 0
end
