class AddTicketToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ticket, :string
  end
end
