class FixIdsInTables < ActiveRecord::Migration[5.0]
  def change
    rename_column :branches, :office_ID, :office_id
    rename_column :services, :branch_ID, :branch_id
    rename_column :tickets, :office_ID, :office_id
    rename_column :tickets, :service_ID, :service_id

  end
end
