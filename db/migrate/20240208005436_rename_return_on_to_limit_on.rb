class RenameReturnOnToLimitOn < ActiveRecord::Migration[7.0]
  def change
    rename_column :loans, :return_on, :limit_on
  end
end
