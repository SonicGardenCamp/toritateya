class Repayment < ApplicationRecord
  validates :amount, presence: true, numericality: { only_integer: true }
  belongs_to :loan
end
