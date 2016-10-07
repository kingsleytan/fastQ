class AddTicketIdToLineups < ActiveRecord::Migration[5.0]
  def change
    add_column :lineups, :ticket_id, :integer
  end
end
