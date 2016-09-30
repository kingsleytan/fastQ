class RemoveColumnFromServices < ActiveRecord::Migration[5.0]
  def change
    remove_column :services, :currentqueue
    remove_column :services, :currentticket
  end
end
