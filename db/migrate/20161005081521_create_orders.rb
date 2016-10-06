class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :status, default: 0
      t.decimal :total
      t.string :bill_id
      t.string :bill_url
      t.datetime :due_at
      t.datetime :paid_at

      t.timestamps
    end
  end
end
