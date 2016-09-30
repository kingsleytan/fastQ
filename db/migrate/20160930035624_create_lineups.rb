class CreateLineups < ActiveRecord::Migration[5.0]
  def change
    create_table :lineups do |t|
      t.integer :currentqueue
      t.integer :currentticket

      t.timestamps
    end
  end
end
