class FixTicketColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :tickets, :branch_ID, :service_ID
  end
end
