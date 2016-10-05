class AddColumnToLineup < ActiveRecord::Migration[5.0]
  def change
    add_column :lineups, :service_id, :integer
  end
end
