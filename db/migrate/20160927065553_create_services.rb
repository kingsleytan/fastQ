class CreateServices < ActiveRecord::Migration[5.0]
  def change
    create_table :services do |t|
      t.integer :currentqueue
      t.integer :currentticket
      t.integer :branch_ID

      t.timestamps
    end
  end
end
