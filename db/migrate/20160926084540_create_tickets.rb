class CreateTickets < ActiveRecord::Migration[5.0]
  def change
    create_table :tickets do |t|
      t.integer :number
      t.integer :branch_ID
      t.integer :office_ID

      t.timestamps
    end
  end
end
