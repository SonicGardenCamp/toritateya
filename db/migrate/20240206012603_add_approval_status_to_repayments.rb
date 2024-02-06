class AddApprovalStatusToRepayments < ActiveRecord::Migration[7.0]
  def change
    add_column :repayments, :approval_status, :integer, default: 0
  end
end
