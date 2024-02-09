class CreateRepayments < ActiveRecord::Migration[7.0]
  def change
    create_table :repayments do |t|
      t.references :loan, null: false, foreign_key: true
      t.integer :amount, null: false

      t.timestamps
    end
  end
end
