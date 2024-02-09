class CreateLoans < ActiveRecord::Migration[7.0]
  def change
    create_table :loans do |t|
      t.references :lend_user, null: false, foreign_key: { to_table: :users}
      t.references :borrow_user, null: false, foreign_key: { to_table: :users}
      t.integer :amount, null: false
      t.string :comment, default: ""
      t.date :return_on, null: false
      t.integer :approval_status, default: 0
      t.timestamps
    end
  end
end
